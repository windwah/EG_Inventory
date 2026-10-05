import { useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import api from '../api/client'
import { useToasts } from '../context/AppContext'

const HALF = 'col-12 col-md-6'
const FULL = 'col-12'

function Field({
  label,
  id,
  type = 'text',
  value,
  onChange,
  error,
  required = false,
  as = 'input',
  rows = 3,
  maxLength,
  placeholder,
}) {
  const cls = `form-control ${error ? 'is-invalid' : ''}`
  return (
    <div className="mb-3">
      <label htmlFor={id} className="form-label small fw-medium">
        {label}
        {required && <span className="text-danger ms-1">*</span>}
      </label>
      {as === 'textarea' ? (
        <textarea
          id={id}
          className={cls}
          rows={rows}
          value={value ?? ''}
          onChange={(e) => onChange(e.target.value)}
          maxLength={maxLength}
          placeholder={placeholder}
        />
      ) : (
        <input
          id={id}
          type={type}
          className={cls}
          value={value ?? ''}
          onChange={(e) => onChange(e.target.value)}
          maxLength={maxLength}
          placeholder={placeholder}
        />
      )}
      {error && <div className="invalid-feedback small">{error}</div>}
    </div>
  )
}

export default function ManufacturerForm({ mode }) {
  const params = useParams()
  const navigate = useNavigate()
  const { pushToast } = useToasts()
  const isEdit = mode === 'edit'
  const id = params.id ? Number(params.id) : null

  const [form, setForm] = useState({
    name: '',
    contactPerson: '',
    contactPhone: '',
    contactEmail: '',
    address: '',
    country: '',
  })
  const [loading, setLoading] = useState(isEdit)
  const [submitting, setSubmitting] = useState(false)
  const [fieldErrors, setFieldErrors] = useState({})
  const [genericError, setGenericError] = useState(null)

  useEffect(() => {
    if (!isEdit) return
    let cancelled = false
    const load = async () => {
      try {
        setLoading(true)
        const res = await api.get(`/manufacturers/${id}`)
        if (cancelled) return
        const d = res.data || {}
        setForm({
          name: d.name || '',
          contactPerson: d.contactPerson || '',
          contactPhone: d.contactPhone || '',
          contactEmail: d.contactEmail || '',
          address: d.address || '',
          country: d.country || '',
        })
      } catch (e) {
        if (cancelled) return
        pushToast(
          e.genericMessage || `Failed to load manufacturer ${id}`,
          'danger',
        )
        navigate('/manufacturers', { replace: true })
      } finally {
        if (!cancelled) setLoading(false)
      }
    }
    load()
    return () => {
      cancelled = true
    }
  }, [isEdit, id, navigate, pushToast])

  const updateField = (key) => (v) => {
    setForm((p) => ({ ...p, [key]: v }))
    if (fieldErrors[key]) {
      setFieldErrors((p) => {
        const c = { ...p }
        delete c[key]
        return c
      })
    }
    if (genericError) setGenericError(null)
  }

  const validate = () => {
    const errs = {}
    if (!String(form.name || '').trim()) {
      errs.name = 'Manufacturer name is required'
    } else if (form.name.length > 128) {
      errs.name = 'Must not exceed 128 characters'
    }
    const email = form.contactEmail
    if (email && email.trim()) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      if (!re.test(String(email).trim())) {
        errs.contactEmail = 'Please enter a valid email address'
      }
    }
    return errs
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setSubmitting(true)
    setGenericError(null)
    setFieldErrors({})
    try {
      const clientErrs = validate()
      if (Object.keys(clientErrs).length > 0) {
        setFieldErrors(clientErrs)
        setGenericError('Please correct the highlighted fields.')
        return
      }
      const payload = {
        name: String(form.name).trim(),
        contactPerson: form.contactPerson || null,
        contactPhone: form.contactPhone || null,
        contactEmail: form.contactEmail ? String(form.contactEmail).trim() : null,
        address: form.address || null,
        country: form.country || null,
      }
      if (isEdit) {
        await api.put(`/manufacturers/${id}`, payload)
        pushToast(`Manufacturer updated: ${payload.name}`, 'success')
      } else {
        await api.post('/manufacturers', payload)
        pushToast(`Manufacturer created: ${payload.name}`, 'success')
      }
      navigate('/manufacturers')
    } catch (e) {
      if (e.fieldErrors) setFieldErrors(e.fieldErrors)
      setGenericError(
        e.genericMessage || 'An error occurred while saving the manufacturer.',
      )
    } finally {
      setSubmitting(false)
    }
  }

  if (loading) {
    return (
      <div className="d-flex justify-content-center py-5">
        <div className="spinner-border text-primary" role="status">
          <span className="visually-hidden">Loading...</span>
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
        <h1 className="h3 mb-0">
          {isEdit ? 'Edit Manufacturer' : 'Add Manufacturer'}
        </h1>
        <Link to="/manufacturers" className="btn btn-outline-secondary btn-sm">
          &larr; Back to Manufacturers
        </Link>
      </div>
      {genericError && (
        <div className="alert alert-danger mb-3" role="alert">
          {genericError}
        </div>
      )}
      <form onSubmit={handleSubmit} noValidate>
        <div className="card shadow-sm">
          <div className="card-body">
            <div className="row g-3">
              <div className={FULL}>
                <Field
                  id="name"
                  label="Name"
                  value={form.name}
                  onChange={updateField('name')}
                  maxLength={128}
                  required
                  error={fieldErrors.name}
                />
              </div>
              <div className={HALF}>
                <Field
                  id="contactPerson"
                  label="Contact Person"
                  value={form.contactPerson}
                  onChange={updateField('contactPerson')}
                  maxLength={128}
                  error={fieldErrors.contactPerson}
                />
              </div>
              <div className={HALF}>
                <Field
                  id="contactPhone"
                  label="Phone"
                  value={form.contactPhone}
                  onChange={updateField('contactPhone')}
                  maxLength={64}
                  error={fieldErrors.contactPhone}
                />
              </div>
              <div className={HALF}>
                <Field
                  id="contactEmail"
                  label="Email"
                  type="email"
                  value={form.contactEmail}
                  onChange={updateField('contactEmail')}
                  maxLength={128}
                  error={fieldErrors.contactEmail}
                />
              </div>
              <div className={HALF}>
                <Field
                  id="country"
                  label="Country"
                  value={form.country}
                  onChange={updateField('country')}
                  maxLength={64}
                  error={fieldErrors.country}
                />
              </div>
              <div className={FULL}>
                <Field
                  id="address"
                  label="Address"
                  as="textarea"
                  rows={3}
                  value={form.address}
                  onChange={updateField('address')}
                  maxLength={500}
                  error={fieldErrors.address}
                />
              </div>
            </div>
          </div>
          <div className="card-footer bg-white d-flex gap-2 justify-content-end flex-wrap">
            <Link to="/manufacturers" className="btn btn-outline-secondary">
              Cancel
            </Link>
            <button
              type="submit"
              className="btn btn-primary"
              disabled={submitting}
            >
              {submitting
                ? 'Saving...'
                : isEdit
                  ? 'Save Changes'
                  : 'Create Manufacturer'}
            </button>
          </div>
        </div>
      </form>
    </div>
  )
}
