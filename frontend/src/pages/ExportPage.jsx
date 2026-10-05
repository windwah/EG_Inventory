import { useEffect, useMemo, useState } from 'react'
import api from '../api/client'
import { useToasts } from '../context/AppContext'
import { usePagination, useSearch, useSort } from '../utils/table'

const priceFmt = (p, c) => {
  if (p == null || Number.isNaN(Number(p))) return '\u2014'
  const currency = c && c.trim() ? c.trim() : 'HKD'
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: currency.length === 3 ? currency : 'HKD',
    maximumFractionDigits: 2,
  }).format(Number(p))
}

export default function ExportPage() {
  const { pushToast } = useToasts()
  const [products, setProducts] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [selected, setSelected] = useState(() => new Set())
  const [amazonResult, setAmazonResult] = useState(null)
  const [ebayResult, setEbayResult] = useState(null)
  const [submittingAmazon, setSubmittingAmazon] = useState(false)
  const [submittingEbay, setSubmittingEbay] = useState(false)

  const load = async () => {
    setLoading(true)
    setError(null)
    try {
      const res = await api.get('/products')
      setProducts(res.data || [])
    } catch (e) {
      setError(e.genericMessage || 'Failed to load products')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
  }, [])

  const selectedIds = useMemo(() => Array.from(selected).sort((a, b) => a - b), [selected])
  const selectedCsv = selectedIds.join(',')
  const hasSelection = selectedIds.length > 0

  const allIds = useMemo(() => products.map((p) => p.id), [products])
  const everythingSelected = allIds.length > 0 && selected.size === allIds.length
  const someSelected = selected.size > 0 && !everythingSelected

  const toggleAll = () => {
    if (everythingSelected) {
      setSelected(new Set())
    } else {
      setSelected(new Set(allIds))
    }
  }

  const toggleOne = (id) => {
    setSelected((prev) => {
      const copy = new Set(prev)
      if (copy.has(id)) copy.delete(id)
      else copy.add(id)
      return copy
    })
  }

  const { filtered, query, setQuery } = useSearch(products, {
    keys: ['sku', 'title', 'brandName', 'manufacturerName'],
  })
  const { sorted, sort, indicator } = useSort(filtered, {
    sortKey: 'sku',
    order: 'asc',
  })
  const {
    pageItems,
    pageSize,
    setPageSize,
    page,
    goToPage,
    totalPages,
    totalItems,
    startIndex,
    endIndex,
    lengthMenu,
    pageNumbers,
  } = usePagination(sorted, { pageSize: 25 })

  const downloadAmazon = () => {
    if (!hasSelection) return
    const url =
      '/api/export/amazon' +
      (selectedCsv ? `?ids=${encodeURIComponent(selectedCsv)}` : '')
    window.location.href = url
    pushToast(
      `Downloading Amazon Excel (${selectedIds.length} products)...`,
      'info',
      3000,
    )
  }

  const downloadEbay = () => {
    if (!hasSelection) return
    const url =
      '/api/export/ebay' +
      (selectedCsv ? `?ids=${encodeURIComponent(selectedCsv)}` : '')
    window.location.href = url
    pushToast(
      `Downloading eBay Excel (${selectedIds.length} products)...`,
      'info',
      3000,
    )
  }

  const submitAmazon = async () => {
    if (!hasSelection) return
    setSubmittingAmazon(true)
    setAmazonResult(null)
    try {
      const res = await api.post(
        '/submit/amazon' +
          (selectedCsv ? `?ids=${encodeURIComponent(selectedCsv)}` : ''),
        null,
      )
      setAmazonResult(res.data)
      pushToast(
        'Amazon submission completed (see results panel below).',
        res.data && res.data.success ? 'success' : 'warning',
      )
    } catch (e) {
      pushToast(
        e.genericMessage || 'Amazon submission failed.',
        'danger',
      )
    } finally {
      setSubmittingAmazon(false)
    }
  }

  const submitEbay = async () => {
    if (!hasSelection) return
    setSubmittingEbay(true)
    setEbayResult(null)
    try {
      const res = await api.post(
        '/submit/ebay' +
          (selectedCsv ? `?ids=${encodeURIComponent(selectedCsv)}` : ''),
        null,
      )
      setEbayResult(res.data)
      pushToast(
        'eBay submission completed (see results panel below).',
        res.data && res.data.success ? 'success' : 'warning',
      )
    } catch (e) {
      pushToast(e.genericMessage || 'eBay submission failed.', 'danger')
    } finally {
      setSubmittingEbay(false)
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

  const renderResult = (title, variant, result, loading) => {
    if (!result && !loading) return null
    return (
      <div className={`card shadow-sm border-${variant}`}>
        <div className={`card-header bg-${variant} bg-opacity-10 fw-semibold`}>
          {title}
        </div>
        <div className="card-body small">
          {loading ? (
            <div className="d-flex align-items-center gap-2 text-muted">
              <span className="spinner-border spinner-border-sm" />
              Processing...
            </div>
          ) : (
            <dl className="row mb-0">
              <dt className="col-sm-4">Mode</dt>
              <dd className="col-sm-8">
                <span className={`badge bg-${result.success ? 'success' : 'secondary'}`}>
                  {result.mode || 'N/A'}
                </span>
              </dd>
              <dt className="col-sm-4">Processed Count</dt>
              <dd className="col-sm-8">
                {typeof result.processedCount === 'number'
                  ? result.processedCount
                  : '\u2014'}
              </dd>
              <dt className="col-sm-4">Success</dt>
              <dd className="col-sm-8">
                {result.success ? (
                  <span className="text-success fw-medium">Yes</span>
                ) : (
                  <span className="text-danger fw-medium">No</span>
                )}
              </dd>
              <dt className="col-sm-4">Messages</dt>
              <dd className="col-sm-8">
                {Array.isArray(result.messages) && result.messages.length > 0 ? (
                  <ul className="mb-0 ps-3">
                    {result.messages.map((m, i) => (
                      <li key={i} className="mb-1">
                        {m}
                      </li>
                    ))}
                  </ul>
                ) : (
                  <span className="text-muted">(none)</span>
                )}
              </dd>
            </dl>
          )}
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
        <h1 className="h3 mb-0">Export / Submit to Marketplaces</h1>
        <div className="text-muted small">
          <strong className="text-primary">{selectedIds.length}</strong>{' '}
          selected of {products.length} total
        </div>
      </div>

      {error && (
        <div className="alert alert-danger mb-3" role="alert">
          {error}
          <button className="btn btn-sm btn-outline-danger ms-2" onClick={load}>
            Retry
          </button>
        </div>
      )}

      <div className="card shadow-sm mb-4 border-primary">
        <div className="card-header bg-primary bg-opacity-10 fw-semibold d-flex flex-wrap gap-2 align-items-center justify-content-between">
          <span>Actions</span>
          <div className="d-flex flex-wrap gap-2">
            <button
              type="button"
              className="btn btn-outline-success btn-sm"
              disabled={!hasSelection}
              onClick={downloadAmazon}
            >
              &#11015; Download Amazon Excel
            </button>
            <button
              type="button"
              className="btn btn-outline-success btn-sm"
              disabled={!hasSelection}
              onClick={downloadEbay}
            >
              &#11015; Download eBay Excel
            </button>
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={!hasSelection || submittingAmazon}
              onClick={submitAmazon}
            >
              {submittingAmazon ? (
                <>
                  <span className="spinner-border spinner-border-sm me-1" />
                  Submitting Amazon...
                </>
              ) : (
                '\u2192 Submit to Amazon API'
              )}
            </button>
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={!hasSelection || submittingEbay}
              onClick={submitEbay}
            >
              {submittingEbay ? (
                <>
                  <span className="spinner-border spinner-border-sm me-1" />
                  Submitting eBay...
                </>
              ) : (
                '\u2192 Submit to eBay API'
              )}
            </button>
          </div>
        </div>
        <div className="card-body">
          <p className="small text-muted mb-0">
            Tip: Use the search box and page controls below. Select the header
            checkbox to select all rows (across all pages), or select individual
            rows for targeted export/submit. All 4 buttons above are disabled
            until at least 1 product is selected.
          </p>
        </div>
      </div>

      {(amazonResult || submittingAmazon || ebayResult || submittingEbay) && (
        <div className="row g-3 mb-4">
          <div className="col-lg-6">
            {renderResult(
              'Amazon Submission Result',
              'success',
              amazonResult,
              submittingAmazon,
            )}
          </div>
          <div className="col-lg-6">
            {renderResult(
              'eBay Submission Result',
              'info',
              ebayResult,
              submittingEbay,
            )}
          </div>
        </div>
      )}

      <div className="card shadow-sm">
        <div className="card-header bg-white d-flex flex-wrap gap-2 align-items-center justify-content-between">
          <div className="d-flex align-items-center gap-2 flex-wrap">
            <label className="form-label mb-0 text-nowrap">Show</label>
            <select
              className="form-select form-select-sm w-auto"
              value={pageSize}
              onChange={(e) => setPageSize(e.target.value)}
            >
              {lengthMenu.map((n) => (
                <option key={n} value={n}>
                  {n}
                </option>
              ))}
            </select>
            <span className="text-muted small">entries</span>
          </div>
          <div
            className="d-flex align-items-center gap-2 flex-grow-1"
            style={{ maxWidth: 360 }}
          >
            <label className="form-label mb-0 text-nowrap">Search:</label>
            <input
              type="search"
              className="form-control form-control-sm"
              placeholder="SKU or title..."
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
          </div>
        </div>
        <div className="card-body p-0">
          <div className="table-responsive">
            <table className="table table-striped table-hover align-middle mb-0">
              <thead className="table-light">
                <tr>
                  <th scope="col" style={{ width: 48 }} className="text-center">
                    <input
                      className="form-check-input"
                      type="checkbox"
                      aria-label="Select all products"
                      checked={everythingSelected}
                      ref={(el) => {
                        if (el) el.indeterminate = someSelected
                      }}
                      onChange={toggleAll}
                    />
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('sku')}
                    className="user-select-none"
                  >
                    SKU
                    {indicator('sku')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('title')}
                    className="user-select-none"
                  >
                    Title
                    {indicator('title')}
                  </th>
                  <th
                    scope="col"
                    className="text-end user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('quantity')}
                  >
                    Qty
                    {indicator('quantity')}
                  </th>
                  <th
                    scope="col"
                    className="text-end user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('price')}
                  >
                    Price
                    {indicator('price')}
                  </th>
                </tr>
              </thead>
              <tbody>
                {pageItems.length === 0 && (
                  <tr>
                    <td colSpan={5} className="text-center py-4 text-muted">
                      No products found.
                    </td>
                  </tr>
                )}
                {pageItems.map((p) => {
                  const checked = selected.has(p.id)
                  return (
                    <tr key={p.id} className={checked ? 'table-active' : ''}>
                      <td className="text-center">
                        <input
                          className="form-check-input"
                          type="checkbox"
                          name="selectedId"
                          value={p.id}
                          checked={checked}
                          onChange={() => toggleOne(p.id)}
                          aria-label={`Select product ${p.sku}`}
                        />
                      </td>
                      <td className="text-nowrap">
                        <code className="small">{p.sku}</code>
                      </td>
                      <td style={{ minWidth: 280 }}>{p.title}</td>
                      <td className="text-end">
                        {p.quantity != null && !Number.isNaN(Number(p.quantity))
                          ? new Intl.NumberFormat('en-US').format(
                              Number(p.quantity),
                            )
                          : '\u2014'}
                      </td>
                      <td className="text-end text-nowrap">
                        {priceFmt(p.price, p.currency)}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </div>
        <div className="card-footer bg-white d-flex flex-wrap gap-2 align-items-center justify-content-between">
          <div className="text-muted small">
            Showing{' '}
            <strong>
              {totalItems === 0 ? 0 : startIndex} to {endIndex}
            </strong>{' '}
            of <strong>{totalItems}</strong> products
          </div>
          <nav aria-label="Export products pagination">
            <ul className="pagination pagination-sm mb-0">
              <li className={`page-item ${page <= 1 ? 'disabled' : ''}`}>
                <button
                  className="page-link"
                  onClick={() => goToPage(1)}
                  disabled={page <= 1}
                  type="button"
                >
                  First
                </button>
              </li>
              <li className={`page-item ${page <= 1 ? 'disabled' : ''}`}>
                <button
                  className="page-link"
                  onClick={() => goToPage(page - 1)}
                  disabled={page <= 1}
                  type="button"
                >
                  &lsaquo;
                </button>
              </li>
              {pageNumbers.pages.map((n) => (
                <li
                  key={n}
                  className={`page-item ${n === page ? 'active' : ''}`}
                >
                  <button
                    className="page-link"
                    onClick={() => goToPage(n)}
                    type="button"
                  >
                    {n}
                  </button>
                </li>
              ))}
              <li
                className={`page-item ${page >= totalPages ? 'disabled' : ''}`}
              >
                <button
                  className="page-link"
                  onClick={() => goToPage(page + 1)}
                  disabled={page >= totalPages}
                  type="button"
                >
                  &rsaquo;
                </button>
              </li>
              <li
                className={`page-item ${page >= totalPages ? 'disabled' : ''}`}
              >
                <button
                  className="page-link"
                  onClick={() => goToPage(totalPages)}
                  disabled={page >= totalPages}
                  type="button"
                >
                  Last
                </button>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  )
}
