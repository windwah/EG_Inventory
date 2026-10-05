import { useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import api from '../api/client'
import { useToasts } from '../context/AppContext'

const INPUT = 'col-12 col-md-6'
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

export default function BrandForm({ mode }) {
  const params = useParams()
  const navigate = useNavigate()
  const { pushToast } = useToasts()
  const isEdit = mode === 'edit'
  const id = params.id ? Number(params.id) : null

  const [form, setForm] = useState({
    name: '',
    amazonBrandStoreUrl: '',
    logoUrl: '',
    description: '',
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
        const res = await api.get(`/brands/${id}`)
        if (cancelled) return
        const d = res.data || {}
        setForm({
          name: d.name || '',
          amazonBrandStoreUrl: d.amazonBrandStoreUrl || '',
          logoUrl: d.logoUrl || '',
          description: d.description || '',
        })
      } catch (e) {
        if (cancelled) return
        pushToast(
          e.genericMessage || `Failed to load brand ${id}`,
          'danger',
        )
        navigate('/brands', { replace: true })
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
      errs.name = 'Brand name is required'
    } else if (form.name.length > 128) {
      errs.name = 'Brand name must not exceed 128 characters'
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
        amazonBrandStoreUrl: form.amazonBrandStoreUrl || null,
        logoUrl: form.logoUrl || null,
        description: form.description || null,
      }
      if (isEdit) {
        await api.put(`/brands/${id}`, payload)
        pushToast(`Brand updated: ${payload.name}`, 'success')
      } else {
        await api.post('/brands', payload)
        pushToast(`Brand created: ${payload.name}`, 'success')
      }
      navigate('/brands')
    } catch (e) {
      if (e.fieldErrors) setFieldErrors(e.fieldErrors)
      setGenericError(
        e.genericMessage || 'An error occurred while saving the brand.',
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
          {isEdit ? 'Edit Brand' : 'Add Brand'}
        </h1>
        <Link to="/brands" className="btn btn-outline-secondary btn-sm">
          &larr; Back to Brands
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
              <div className={INPUT}>
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
              <div className={INPUT}>
                <Field
                  id="amazonBrandStoreUrl"
                  label="Amazon Brand Store URL"
                  value={form.amazonBrandStoreUrl}
                  onChange={updateField('amazonBrandStoreUrl')}
                  maxLength={255}
                  error={fieldErrors.amazonBrandStoreUrl}
                />
              </div>
              <div className={FULL}>
                <Field
                  id="logoUrl"
                  label="Logo URL"
                  value={form.logoUrl}
                  onChange={updateField('logoUrl')}
                  maxLength={2048}
                  error={fieldErrors.logoUrl}
                />
              </div>
              <div className={FULL}>
                <Field
                  id="description"
                  label="Description"
                  as="textarea"
                  rows={4}
                  value={form.description}
                  onChange={updateField('description')}
                  maxLength={2000}
                  error={fieldErrors.description}
                />
              </div>
            </div>
          </div>
          <div className="card-footer bg-white d-flex gap-2 justify-content-end flex-wrap">
            <Link to="/brands" className="btn btn-outline-secondary">
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
                  : 'Create Brand'}
            </button>
          </div>
        </div>
      </form>
    </div>
  )
}
