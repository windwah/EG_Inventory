import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import api from '../api/client'
import { useToasts } from '../context/AppContext'
import { usePagination, useSearch, useSort } from '../utils/table'

const dateFmt = (s) => {
  if (!s) return '\u2014'
  try {
    return new Date(s).toLocaleString()
  } catch {
    return String(s)
  }
}

export default function BrandList() {
  const { pushToast } = useToasts()
  const [items, setItems] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const load = async () => {
    setLoading(true)
    setError(null)
    try {
      const res = await api.get('/brands')
      setItems(res.data || [])
    } catch (e) {
      setError(e.genericMessage || 'Failed to load brands')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
  }, [])

  const { filtered, query, setQuery } = useSearch(items, {
    keys: ['name', 'amazonBrandStoreUrl', 'description'],
  })
  const { sorted, sort, indicator } = useSort(filtered, {
    sortKey: 'name',
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

  const handleDelete = async (b) => {
    const ok = window.confirm(
      `Delete brand: ${b.name}\n\n` +
        `This action is irreversible and may break product references. Continue?`,
    )
    if (!ok) return
    try {
      await api.delete(`/brands/${b.id}`)
      pushToast(`Deleted brand: ${b.name}`, 'success')
      load()
    } catch (e) {
      pushToast(
        e.genericMessage || `Failed to delete brand: ${b.name}`,
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
        <h1 className="h3 mb-0">Brands</h1>
        <Link to="/brands/new" className="btn btn-primary btn-sm">
          + Add Brand
        </Link>
      </div>

      {error && (
        <div className="alert alert-danger mb-3" role="alert">
          {error}
          <button className="btn btn-sm btn-outline-danger ms-2" onClick={load}>
            Retry
          </button>
        </div>
      )}

      <div className="card shadow-sm">
        <div className="card-header bg-white d-flex flex-wrap gap-2 align-items-center justify-content-between">
          <div className="d-flex align-items-center gap-2">
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
            className="d-flex align-items-center gap-2"
            style={{ maxWidth: 360 }}
          >
            <label className="form-label mb-0 text-nowrap">Search:</label>
            <input
              type="search"
              className="form-control form-control-sm"
              placeholder="Brand name, URL..."
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
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('id')}
                    className="user-select-none"
                  >
                    #
                    {indicator('id')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('name')}
                    className="user-select-none"
                  >
                    Name
                    {indicator('name')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('amazonBrandStoreUrl')}
                    className="user-select-none"
                  >
                    Amazon Store URL
                    {indicator('amazonBrandStoreUrl')}
                  </th>
                  <th scope="col">Description</th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('createdAt')}
                    className="user-select-none text-nowrap"
                  >
                    Created At
                    {indicator('createdAt')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('updatedAt')}
                    className="user-select-none text-nowrap"
                  >
                    Updated At
                    {indicator('updatedAt')}
                  </th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                {pageItems.length === 0 && (
                  <tr>
                    <td colSpan={7} className="text-center py-4 text-muted">
                      No brands found.
                    </td>
                  </tr>
                )}
                {pageItems.map((b) => (
                  <tr key={b.id}>
                    <th scope="row" className="text-muted small">
                      {b.id}
                    </th>
                    <td className="fw-medium">{b.name}</td>
                    <td>
                      {b.amazonBrandStoreUrl ? (
                        <a
                          href={b.amazonBrandStoreUrl}
                          target="_blank"
                          rel="noopener noreferrer"
                        >
                          {b.amazonBrandStoreUrl.length > 60
                            ? b.amazonBrandStoreUrl.slice(0, 57) + '...'
                            : b.amazonBrandStoreUrl}
                        </a>
                      ) : (
                        '\u2014'
                      )}
                    </td>
                    <td style={{ maxWidth: 320 }}>
                      {b.description ? (
                        <span className="small text-muted">
                          {b.description.length > 120
                            ? b.description.slice(0, 117) + '...'
                            : b.description}
                        </span>
                      ) : (
                        '\u2014'
                      )}
                    </td>
                    <td className="text-nowrap small">
                      {dateFmt(b.createdAt)}
                    </td>
                    <td className="text-nowrap small">
                      {dateFmt(b.updatedAt)}
                    </td>
                    <td className="text-nowrap">
                      <div className="d-flex gap-1">
                        <Link
                          to={`/brands/${b.id}/edit`}
                          className="btn btn-outline-primary btn-sm"
                        >
                          Edit
                        </Link>
                        <button
                          type="button"
                          className="btn btn-outline-danger btn-sm"
                          onClick={() => handleDelete(b)}
                        >
                          Delete
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
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
            of <strong>{totalItems}</strong> brands
          </div>
          <nav aria-label="Brands pagination">
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
