import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import api from '../api/client'
import { useToasts } from '../context/AppContext'
import { usePagination, useSearch, useSort } from '../utils/table'

const eurFmt = (n) => {
  if (n == null || Number.isNaN(n)) return '\u2014'
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'EUR',
    maximumFractionDigits: 2,
  }).format(Number(n))
}

const qtyFmt = (n) => {
  if (n == null || Number.isNaN(n)) return '\u2014'
  return new Intl.NumberFormat('en-US').format(Number(n))
}

const availabilityBadge = (a) => {
  if (!a) {
    return (
      <span className="badge bg-secondary text-white">N/A</span>
    )
  }
  const s = String(a).toLowerCase()
  let cls = 'bg-secondary'
  if (s.includes('available') || s.includes('in stock')) {
    cls = 'bg-success'
  } else if (s.includes('new') || s.includes('production')) {
    cls = 'bg-warning text-dark'
  } else if (/^\d/.test(a) || s.includes('date') || s.includes('ship')) {
    cls = 'bg-info text-dark'
  }
  return <span className={`badge ${cls}`}>{a}</span>
}

const parseImgUrls = (raw) => {
  if (!raw) return []
  if (Array.isArray(raw)) return raw.filter(Boolean)
  if (typeof raw === 'string') {
    return raw
      .split(/[\n,;|]+/)
      .map((s) => s.trim())
      .filter(Boolean)
  }
  return []
}

export default function ProductList() {
  const { pushToast } = useToasts()
  const [products, setProducts] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

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

  const searchKeys = useMemo(
    () => [
      'title',
      'sku',
      'brandName',
      'manufacturerName',
      'collection',
      'listingStatus',
      'indexCode',
    ],
    [],
  )

  const { filtered, query, setQuery } = useSearch(products, { keys: searchKeys })
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

  const handleDelete = async (p) => {
    const ok = window.confirm(
      `Delete product SKU: ${p.sku}\n\n` +
        `Title: ${p.title}\n\n` +
        `This action is irreversible and cannot be undone. Continue?`,
    )
    if (!ok) return
    try {
      await api.delete(`/products/${p.id}`)
      pushToast(`Deleted product SKU: ${p.sku}`, 'success')
      load()
    } catch (e) {
      pushToast(
        e.genericMessage || `Failed to delete product: ${p.sku}`,
        'danger',
      )
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
        <h1 className="h3 mb-0">Products</h1>
        <Link to="/products/new" className="btn btn-primary btn-sm">
          + Add Product
        </Link>
      </div>

      {error && (
        <div className="alert alert-danger mb-3" role="alert">
          {error}
          <button
            className="btn btn-sm btn-outline-danger ms-2"
            onClick={load}
          >
            Retry
          </button>
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
          <div className="d-flex align-items-center gap-2 flex-grow-1 flex-sm-nowrap" style={{ maxWidth: 360 }}>
            <label className="form-label mb-0 text-nowrap">Search:</label>
            <input
              type="search"
              className="form-control form-control-sm"
              placeholder="SKU, title, brand..."
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
                  <th
                    scope="col"
                    className="text-nowrap cursor-pointer user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('id')}
                  >
                    #
                    {indicator('id')}
                  </th>
                  <th scope="col">Image</th>
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
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('brandName')}
                    className="user-select-none"
                  >
                    Brand
                    {indicator('brandName')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('manufacturerName')}
                    className="user-select-none"
                  >
                    Manufacturer
                    {indicator('manufacturerName')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('collection')}
                    className="user-select-none"
                  >
                    Collection
                    {indicator('collection')}
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
                    onClick={() => sort('purchasePrice')}
                  >
                    Purchase
                    {indicator('purchasePrice')}
                  </th>
                  <th
                    scope="col"
                    className="text-end user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('rrpEur')}
                  >
                    RRP (EUR)
                    {indicator('rrpEur')}
                  </th>
                  <th
                    scope="col"
                    className="user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('availability')}
                  >
                    Availability
                    {indicator('availability')}
                  </th>
                  <th
                    scope="col"
                    className="user-select-none"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('listingStatus')}
                  >
                    Listing Status
                    {indicator('listingStatus')}
                  </th>
                  <th scope="col" className="text-nowrap">Actions</th>
                </tr>
              </thead>
              <tbody>
                {pageItems.length === 0 && (
                  <tr>
                    <td colSpan={13} className="text-center py-4 text-muted">
                      No products found.
                    </td>
                  </tr>
                )}
                {pageItems.map((p, idx) => {
                  const imgs = parseImgUrls(p.imageUrls)
                  const firstImg = imgs[0]
                  const rowIndex = startIndex + idx
                  return (
                    <tr key={p.id}>
                      <th scope="row" className="text-muted small">
                        {rowIndex}
                      </th>
                      <td style={{ width: 80 }}>
                        {firstImg ? (
                          <a
                            href={firstImg}
                            target="_blank"
                            rel="noopener noreferrer"
                          >
                            <img
                              src={firstImg}
                              alt={p.sku || 'product'}
                              className="img-thumbnail"
                              style={{
                                maxWidth: 64,
                                maxHeight: 64,
                                objectFit: 'contain',
                              }}
                              onError={(e) => {
                                e.currentTarget.style.display = 'none'
                              }}
                            />
                          </a>
                        ) : (
                          <span className="badge bg-light text-secondary border">
                            n/a
                          </span>
                        )}
                      </td>
                      <td className="text-nowrap">
                        <code className="small">{p.sku}</code>
                      </td>
                      <td style={{ minWidth: 220 }}>{p.title}</td>
                      <td>{p.brandName || '\u2014'}</td>
                      <td>{p.manufacturerName || '\u2014'}</td>
                      <td>{p.collection || '\u2014'}</td>
                      <td className="text-end">{qtyFmt(p.quantity)}</td>
                      <td className="text-end">{eurFmt(p.purchasePrice)}</td>
                      <td className="text-end">{eurFmt(p.rrpEur)}</td>
                      <td className="text-nowrap">{availabilityBadge(p.availability)}</td>
                      <td className="text-nowrap">
                        {p.listingStatus ? (
                          <span className="badge text-bg-secondary">
                            {p.listingStatus}
                          </span>
                        ) : (
                          '\u2014'
                        )}
                      </td>
                      <td className="text-nowrap">
                        <div className="d-flex gap-1">
                          <Link
                            to={`/products/${p.id}/edit`}
                            className="btn btn-outline-primary btn-sm"
                          >
                            Edit
                          </Link>
                          <button
                            type="button"
                            className="btn btn-outline-danger btn-sm"
                            onClick={() => handleDelete(p)}
                          >
                            Delete
                          </button>
                        </div>
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
          <nav aria-label="Products pagination">
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
