import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import api from '../api/client'
import { useToasts } from '../context/AppContext'

const CONDITION_OPTIONS = [
  { value: '', label: '-- Not set --' },
  { value: 'NEW', label: 'New' },
  { value: 'USED_LIKE_NEW', label: 'Used - Like New' },
  { value: 'USED_VERY_GOOD', label: 'Used - Very Good' },
  { value: 'USED_GOOD', label: 'Used - Good' },
  { value: 'ACCEPTABLE', label: 'Acceptable' },
]

const LISTING_STATUS_OPTIONS = [
  { value: '', label: '-- Not set --' },
  { value: 'ACTIVE', label: 'Active' },
  { value: 'INACTIVE', label: 'Inactive' },
  { value: 'DRAFT', label: 'Draft' },
]

const defaultFormState = {
  sku: '',
  title: '',
  description: '',
  quantity: '',
  price: '',
  currency: 'HKD',
  collection: '',
  indexCode: '',
  purchasePrice: '',
  masterCartonPcs: '',
  boxType: '',
  boxGrossVolumeM3: '',
  masterCartonGrossVolumeM3: '',
  boxGrossWeightKg: '',
  masterCartonGrossWeightKg: '',
  totalMasterCartonVolumeM3: '',
  totalMasterCartonWeightKg: '',
  totalMasterCartonQty: '',
  rrpEur: '',
  rrpText: '',
  availability: '',
  upc: '',
  ean: '',
  mpn: '',
  brandId: '',
  manufacturerId: '',
  brand: '',
  manufacturer: '',
  category: '',
  condition: '',
  imageUrls: '',
  weightKg: '',
  dimensions: '',
  listingStatus: '',
}

const fieldGroupClass = 'col-12 col-md-6 col-xl-4'
const textAreaGroupClass = 'col-12'

function Field({
  label,
  id,
  type = 'text',
  value,
  onChange,
  onBlur,
  placeholder,
  error,
  readOnly = false,
  required = false,
  hint,
  step,
  min,
  max,
  minLength,
  maxLength,
  as = 'input',
  rows = 3,
  options,
  className,
}) {
  const inputClassName = `form-control ${error ? 'is-invalid' : ''}`
  const idSafe = id
  return (
    <div className={`mb-3 ${className || ''}`}>
      <label htmlFor={idSafe} className="form-label small fw-medium">
        {label}
        {required && <span className="text-danger ms-1">*</span>}
      </label>
      {as === 'textarea' ? (
        <textarea
          id={idSafe}
          className={inputClassName}
          value={value ?? ''}
          onChange={(e) => onChange && onChange(e.target.value)}
          onBlur={onBlur}
          placeholder={placeholder}
          readOnly={readOnly}
          rows={rows}
          maxLength={maxLength}
          minLength={minLength}
        />
      ) : as === 'select' ? (
        <select
          id={idSafe}
          className={`form-select ${error ? 'is-invalid' : ''}`}
          value={value ?? ''}
          onChange={(e) => onChange && onChange(e.target.value)}
          onBlur={onBlur}
          disabled={readOnly}
        >
          {(options || []).map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </select>
      ) : (
        <input
          id={idSafe}
          type={type}
          className={inputClassName}
          value={value ?? ''}
          onChange={(e) => onChange && onChange(e.target.value)}
          onBlur={onBlur}
          placeholder={placeholder}
          readOnly={readOnly}
          step={step}
          min={min}
          max={max}
          maxLength={maxLength}
          minLength={minLength}
        />
      )}
      {hint && !error && (
        <div className="form-text small">{hint}</div>
      )}
      {error && <div className="invalid-feedback small">{error}</div>}
    </div>
  )
}

export default function ProductForm({ mode }) {
  const params = useParams()
  const navigate = useNavigate()
  const { pushToast } = useToasts()
  const isEdit = mode === 'edit'
  const productId = params.id ? Number(params.id) : null

  const [form, setForm] = useState(defaultFormState)
  const [brands, setBrands] = useState([])
  const [manufacturers, setManufacturers] = useState([])
  const [loading, setLoading] = useState(isEdit)
  const [submitting, setSubmitting] = useState(false)
  const [fieldErrors, setFieldErrors] = useState({})
  const [genericError, setGenericError] = useState(null)

  useEffect(() => {
    let cancelled = false
    const loadRefs = async () => {
      try {
        const [bRes, mRes] = await Promise.all([
          api.get('/brands'),
          api.get('/manufacturers'),
        ])
        if (cancelled) return
        setBrands(bRes.data || [])
        setManufacturers(mRes.data || [])
      } catch (e) {
        if (cancelled) return
        pushToast(
          e.genericMessage || 'Failed to load brands and manufacturers',
          'warning',
        )
      }
    }
    loadRefs()
    return () => {
      cancelled = true
    }
  }, [pushToast])

  useEffect(() => {
    if (!isEdit) return
    let cancelled = false
    const load = async () => {
      try {
        setLoading(true)
        const res = await api.get(`/products/${productId}`)
        if (cancelled) return
        const d = res.data || {}
        setForm({
          sku: d.sku || '',
          title: d.title || '',
          description: d.description || '',
          quantity: d.quantity ?? '',
          price: d.price ?? '',
          currency: d.currency || 'HKD',
          collection: d.collection || '',
          indexCode: d.indexCode || '',
          purchasePrice: d.purchasePrice ?? '',
          masterCartonPcs: d.masterCartonPcs ?? '',
          boxType: d.boxType || '',
          boxGrossVolumeM3: d.boxGrossVolumeM3 ?? '',
          masterCartonGrossVolumeM3: d.masterCartonGrossVolumeM3 ?? '',
          boxGrossWeightKg: d.boxGrossWeightKg ?? '',
          masterCartonGrossWeightKg: d.masterCartonGrossWeightKg ?? '',
          totalMasterCartonVolumeM3: d.totalMasterCartonVolumeM3 ?? '',
          totalMasterCartonWeightKg: d.totalMasterCartonWeightKg ?? '',
          totalMasterCartonQty: d.totalMasterCartonQty ?? '',
          rrpEur: d.rrpEur ?? '',
          rrpText: d.rrpText || '',
          availability: d.availability || '',
          upc: d.upc || '',
          ean: d.ean || '',
          mpn: d.mpn || '',
          brandId: d.brandId ?? '',
          manufacturerId: d.manufacturerId ?? '',
          brand: '',
          manufacturer: '',
          category: d.category || '',
          condition: d.condition || '',
          imageUrls: Array.isArray(d.imageUrls)
            ? d.imageUrls.join('\n')
            : d.imageUrls || '',
          weightKg: d.weightKg ?? '',
          dimensions: d.dimensions || '',
          listingStatus: d.listingStatus || '',
        })
      } catch (e) {
        if (cancelled) return
        pushToast(
          e.genericMessage || `Failed to load product ${productId}`,
          'danger',
        )
        navigate('/products', { replace: true })
      } finally {
        if (!cancelled) setLoading(false)
      }
    }
    load()
    return () => {
      cancelled = true
    }
  }, [isEdit, productId, navigate, pushToast])

  const updateField = (key) => (value) => {
    setForm((prev) => ({ ...prev, [key]: value }))
    if (fieldErrors[key]) {
      setFieldErrors((prev) => {
        const copy = { ...prev }
        delete copy[key]
        return copy
      })
    }
    if (genericError) setGenericError(null)
  }

  const brandOptions = useMemo(() => {
    const opts = [{ value: '', label: '-- Select or enter below --' }]
    ;(brands || []).forEach((b) =>
      opts.push({ value: String(b.id), label: b.name }),
    )
    return opts
  }, [brands])

  const manufacturerOptions = useMemo(() => {
    const opts = [{ value: '', label: '-- Select or enter below --' }]
    ;(manufacturers || []).forEach((m) =>
      opts.push({ value: String(m.id), label: m.name }),
    )
    return opts
  }, [manufacturers])

  const validateClient = () => {
    const errs = {}
    if (!isEdit && !String(form.sku || '').trim()) {
      errs.sku = 'SKU is required'
    }
    if (!String(form.title || '').trim()) {
      errs.title = 'Title is required'
    }
    const qty = Number(form.quantity)
    if (form.quantity === '' || Number.isNaN(qty)) {
      errs.quantity = 'Quantity is required'
    } else if (qty < 0) {
      errs.quantity = 'Quantity must be >= 0'
    }
    const price = Number(form.price)
    if (form.price === '' || Number.isNaN(price)) {
      errs.price = 'Price is required'
    } else if (price <= 0) {
      errs.price = 'Price must be > 0'
    }
    return errs
  }

  const buildPayload = () => {
    const f = form
    const toNum = (v, allowEmpty = true) => {
      if (v === '' || v == null) return allowEmpty ? undefined : 0
      const n = Number(v)
      return Number.isNaN(n) ? undefined : n
    }
    const toInt = (v, allowEmpty = true) => {
      if (v === '' || v == null) return allowEmpty ? undefined : 0
      const n = Number(v)
      return Number.isNaN(n) ? undefined : Math.floor(n)
    }
    const payload = {
      title: String(f.title || '').trim() || null,
      description: f.description || null,
      quantity: toInt(f.quantity, false),
      price: toNum(f.price, false),
      currency: f.currency || null,
      collection: f.collection || null,
      indexCode: f.indexCode || null,
      purchasePrice: toNum(f.purchasePrice),
      masterCartonPcs: toInt(f.masterCartonPcs),
      boxType: f.boxType || null,
      boxGrossVolumeM3: toNum(f.boxGrossVolumeM3),
      masterCartonGrossVolumeM3: toNum(f.masterCartonGrossVolumeM3),
      boxGrossWeightKg: toNum(f.boxGrossWeightKg),
      masterCartonGrossWeightKg: toNum(f.masterCartonGrossWeightKg),
      totalMasterCartonVolumeM3: toNum(f.totalMasterCartonVolumeM3),
      totalMasterCartonWeightKg: toNum(f.totalMasterCartonWeightKg),
      totalMasterCartonQty: toInt(f.totalMasterCartonQty),
      rrpEur: toNum(f.rrpEur),
      rrpText: f.rrpText || null,
      availability: f.availability || null,
      upc: f.upc || null,
      ean: f.ean || null,
      mpn: f.mpn || null,
      brandId: f.brandId ? Number(f.brandId) || undefined : undefined,
      manufacturerId: f.manufacturerId
        ? Number(f.manufacturerId) || undefined
        : undefined,
      brand: f.brand || undefined,
      manufacturer: f.manufacturer || undefined,
      category: f.category || null,
      condition: f.condition || null,
      imageUrls: f.imageUrls || null,
      weightKg: toNum(f.weightKg),
      dimensions: f.dimensions || null,
      listingStatus: f.listingStatus || null,
    }
    if (!isEdit) {
      payload.sku = String(f.sku || '').trim() || null
    }
    ;['brandId', 'manufacturerId', 'brand', 'manufacturer'].forEach((k) => {
      if (payload[k] === null || payload[k] === undefined) {
        delete payload[k]
      }
    })
    Object.keys(payload).forEach((k) => {
      if (payload[k] === null || payload[k] === undefined) delete payload[k]
    })
    return payload
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setSubmitting(true)
    setGenericError(null)
    setFieldErrors({})
    try {
      const clientErrs = validateClient()
      if (Object.keys(clientErrs).length > 0) {
        setFieldErrors(clientErrs)
        setGenericError('Please correct the highlighted fields.')
        return
      }
      const payload = buildPayload()
      if (isEdit) {
        await api.put(`/products/${productId}`, payload)
        pushToast(`Product updated: ${form.sku || productId}`, 'success')
      } else {
        await api.post('/products', payload)
        pushToast(`Product created: ${form.sku}`, 'success')
      }
      navigate('/products')
    } catch (e) {
      if (e.fieldErrors) {
        setFieldErrors(e.fieldErrors)
      }
      setGenericError(
        e.genericMessage || 'An error occurred while saving the product.',
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

  const pageTitle = isEdit ? `Edit Product: ${form.sku}` : 'Add Product'

  return (
    <div>
      <div className="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
        <h1 className="h3 mb-0">{pageTitle}</h1>
        <Link to="/products" className="btn btn-outline-secondary btn-sm">
          &larr; Back to Products
        </Link>
      </div>

      {genericError && (
        <div className="alert alert-danger mb-3" role="alert">
          {genericError}
        </div>
      )}

      <form onSubmit={handleSubmit} noValidate>
        <div className="card shadow-sm mb-4">
          <div className="card-header bg-white fw-semibold">
            Core Information
          </div>
          <div className="card-body">
            <div className="row g-3">
              <div className={fieldGroupClass}>
                <Field
                  id="sku"
                  label="SKU"
                  value={form.sku}
                  onChange={updateField('sku')}
                  readOnly={isEdit}
                  required={!isEdit}
                  maxLength={64}
                  error={fieldErrors.sku}
                />
              </div>
              <div className="col-12 col-md-6">
                <Field
                  id="title"
                  label="Title"
                  value={form.title}
                  onChange={updateField('title')}
                  required
                  maxLength={512}
                  error={fieldErrors.title}
                />
              </div>
              <div className={textAreaGroupClass}>
                <Field
                  id="description"
                  label="Description"
                  as="textarea"
                  rows={3}
                  value={form.description}
                  onChange={updateField('description')}
                  maxLength={4000}
                  error={fieldErrors.description}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="quantity"
                  label="Quantity"
                  type="number"
                  value={form.quantity}
                  onChange={updateField('quantity')}
                  min={0}
                  step={1}
                  required
                  error={fieldErrors.quantity}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="price"
                  label="Price"
                  type="number"
                  value={form.price}
                  onChange={updateField('price')}
                  min={0}
                  step="0.01"
                  required
                  error={fieldErrors.price}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="currency"
                  label="Currency"
                  value={form.currency}
                  onChange={updateField('currency')}
                  maxLength={8}
                  placeholder="HKD, USD, EUR"
                  error={fieldErrors.currency}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="category"
                  label="Category"
                  value={form.category}
                  onChange={updateField('category')}
                  maxLength={256}
                  error={fieldErrors.category}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="condition"
                  label="Condition"
                  as="select"
                  value={form.condition}
                  onChange={updateField('condition')}
                  options={CONDITION_OPTIONS}
                  error={fieldErrors.condition}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="listingStatus"
                  label="Listing Status"
                  as="select"
                  value={form.listingStatus}
                  onChange={updateField('listingStatus')}
                  options={LISTING_STATUS_OPTIONS}
                  error={fieldErrors.listingStatus}
                />
              </div>
            </div>
          </div>
        </div>

        <div className="card shadow-sm mb-4">
          <div className="card-header bg-white fw-semibold">
            Brand &amp; Manufacturer
          </div>
          <div className="card-body">
            <div className="row g-3">
              <div className={fieldGroupClass}>
                <Field
                  id="brandId"
                  label="Brand (select existing)"
                  as="select"
                  value={form.brandId}
                  onChange={updateField('brandId')}
                  options={brandOptions}
                  error={fieldErrors.brandId}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="brand"
                  label="Brand name (or create by name)"
                  value={form.brand}
                  onChange={updateField('brand')}
                  maxLength={128}
                  hint="Leave blank if selected above. Backend auto-creates if name is new."
                  error={fieldErrors.brand}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="manufacturerId"
                  label="Manufacturer (select existing)"
                  as="select"
                  value={form.manufacturerId}
                  onChange={updateField('manufacturerId')}
                  options={manufacturerOptions}
                  error={fieldErrors.manufacturerId}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="manufacturer"
                  label="Manufacturer name (or create by name)"
                  value={form.manufacturer}
                  onChange={updateField('manufacturer')}
                  maxLength={128}
                  hint="Leave blank if selected above. Backend auto-creates if name is new."
                  error={fieldErrors.manufacturer}
                />
              </div>
            </div>
          </div>
        </div>

        <div className="card shadow-sm mb-4">
          <div className="card-header bg-white fw-semibold">
            E-Gate Offer / COBI Details (15 fields)
          </div>
          <div className="card-body">
            <div className="row g-3">
              <div className={fieldGroupClass}>
                <Field
                  id="collection"
                  label="Collection"
                  value={form.collection}
                  onChange={updateField('collection')}
                  maxLength={128}
                  error={fieldErrors.collection}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="indexCode"
                  label="Index Code"
                  value={form.indexCode}
                  onChange={updateField('indexCode')}
                  maxLength={128}
                  error={fieldErrors.indexCode}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="purchasePrice"
                  label="Purchase Price"
                  type="number"
                  step="0.01"
                  min={0}
                  value={form.purchasePrice}
                  onChange={updateField('purchasePrice')}
                  error={fieldErrors.purchasePrice}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="masterCartonPcs"
                  label="Master Carton Pcs"
                  type="number"
                  step={1}
                  min={0}
                  value={form.masterCartonPcs}
                  onChange={updateField('masterCartonPcs')}
                  error={fieldErrors.masterCartonPcs}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="boxType"
                  label="Box Type"
                  value={form.boxType}
                  onChange={updateField('boxType')}
                  maxLength={32}
                  error={fieldErrors.boxType}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="boxGrossVolumeM3"
                  label="Box Gross Volume (m3)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.boxGrossVolumeM3}
                  onChange={updateField('boxGrossVolumeM3')}
                  error={fieldErrors.boxGrossVolumeM3}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="masterCartonGrossVolumeM3"
                  label="Master Carton Gross Volume (m3)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.masterCartonGrossVolumeM3}
                  onChange={updateField('masterCartonGrossVolumeM3')}
                  error={fieldErrors.masterCartonGrossVolumeM3}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="boxGrossWeightKg"
                  label="Box Gross Weight (kg)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.boxGrossWeightKg}
                  onChange={updateField('boxGrossWeightKg')}
                  error={fieldErrors.boxGrossWeightKg}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="masterCartonGrossWeightKg"
                  label="Master Carton Gross Weight (kg)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.masterCartonGrossWeightKg}
                  onChange={updateField('masterCartonGrossWeightKg')}
                  error={fieldErrors.masterCartonGrossWeightKg}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="totalMasterCartonVolumeM3"
                  label="Total Master Carton Volume (m3)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.totalMasterCartonVolumeM3}
                  onChange={updateField('totalMasterCartonVolumeM3')}
                  error={fieldErrors.totalMasterCartonVolumeM3}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="totalMasterCartonWeightKg"
                  label="Total Master Carton Weight (kg)"
                  type="number"
                  step="0.000001"
                  min={0}
                  value={form.totalMasterCartonWeightKg}
                  onChange={updateField('totalMasterCartonWeightKg')}
                  error={fieldErrors.totalMasterCartonWeightKg}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="totalMasterCartonQty"
                  label="Total Master Carton Qty"
                  type="number"
                  step={1}
                  min={0}
                  value={form.totalMasterCartonQty}
                  onChange={updateField('totalMasterCartonQty')}
                  error={fieldErrors.totalMasterCartonQty}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="rrpEur"
                  label="RRP (EUR)"
                  type="number"
                  step="0.01"
                  min={0}
                  value={form.rrpEur}
                  onChange={updateField('rrpEur')}
                  error={fieldErrors.rrpEur}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="rrpText"
                  label="RRP (raw text)"
                  value={form.rrpText}
                  onChange={updateField('rrpText')}
                  maxLength={128}
                  error={fieldErrors.rrpText}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="availability"
                  label="Availability"
                  value={form.availability}
                  onChange={updateField('availability')}
                  maxLength={128}
                  placeholder="e.g. AVAILABLE, NEW PRODUCTION, 31.10.2026"
                  error={fieldErrors.availability}
                />
              </div>
            </div>
          </div>
        </div>

        <div className="card shadow-sm mb-4">
          <div className="card-header bg-white fw-semibold">
            Product Codes, Dimensions &amp; Images
          </div>
          <div className="card-body">
            <div className="row g-3">
              <div className={fieldGroupClass}>
                <Field
                  id="upc"
                  label="UPC"
                  value={form.upc}
                  onChange={updateField('upc')}
                  maxLength={32}
                  error={fieldErrors.upc}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="ean"
                  label="EAN"
                  value={form.ean}
                  onChange={updateField('ean')}
                  maxLength={32}
                  error={fieldErrors.ean}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="mpn"
                  label="MPN"
                  value={form.mpn}
                  onChange={updateField('mpn')}
                  maxLength={64}
                  error={fieldErrors.mpn}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="weightKg"
                  label="Weight (kg)"
                  type="number"
                  step="0.001"
                  min={0}
                  value={form.weightKg}
                  onChange={updateField('weightKg')}
                  error={fieldErrors.weightKg}
                />
              </div>
              <div className={fieldGroupClass}>
                <Field
                  id="dimensions"
                  label="Dimensions"
                  value={form.dimensions}
                  onChange={updateField('dimensions')}
                  maxLength={128}
                  placeholder="e.g. 30x20x10 cm"
                  error={fieldErrors.dimensions}
                />
              </div>
              <div className={textAreaGroupClass}>
                <Field
                  id="imageUrls"
                  label="Image URLs (one per line, comma or semicolon separated)"
                  as="textarea"
                  rows={4}
                  value={form.imageUrls}
                  onChange={updateField('imageUrls')}
                  maxLength={4000}
                  hint="e.g. /extracted_images/img_A37.png"
                  error={fieldErrors.imageUrls}
                />
              </div>
            </div>
          </div>
        </div>

        <div className="card shadow-sm mb-5">
          <div className="card-body d-flex gap-2 justify-content-end flex-wrap">
            <Link to="/products" className="btn btn-outline-secondary">
              Cancel
            </Link>
            <button
              type="submit"
              className="btn btn-primary"
              disabled={submitting}
            >
              {submitting ? (
                <>
                  <span
                    className="spinner-border spinner-border-sm me-2"
                    aria-hidden="true"
                  />
                  Saving...
                </>
              ) : isEdit ? (
                'Save Changes'
              ) : (
                'Create Product'
              )}
            </button>
          </div>
        </div>
      </form>
    </div>
  )
}
