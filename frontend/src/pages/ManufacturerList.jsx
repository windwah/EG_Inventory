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

export default function ManufacturerList() {
  const { pushToast } = useToasts()
  const [items, setItems] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const load = async () => {
    setLoading(true)
    setError(null)
    try {
      const res = await api.get('/manufacturers')
      setItems(res.data || [])
    } catch (e) {
      setError(e.genericMessage || 'Failed to load manufacturers')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
  }, [])

  const { filtered, query, setQuery } = useSearch(items, {
    keys: ['name', 'contactPerson', 'contactPhone', 'contactEmail', 'address', 'country'],
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

  const handleDelete = async (m) => {
    const ok = window.confirm(
      `Delete manufacturer: ${m.name}\n\n` +
        `This action is irreversible and may break product references. Continue?`,
    )
    if (!ok) return
    try {
      await api.delete(`/manufacturers/${m.id}`)
      pushToast(`Deleted manufacturer: ${m.name}`, 'success')
      load()
    } catch (e) {
      pushToast(
        e.genericMessage || `Failed to delete manufacturer: ${m.name}`,
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
        <h1 className="h3 mb-0">Manufacturers</h1>
        <Link to="/manufacturers/new" className="btn btn-primary btn-sm">
          + Add Manufacturer
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
              placeholder="Name, contact, country..."
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
                    onClick={() => sort('contactPerson')}
                    className="user-select-none"
                  >
                    Contact Person
                    {indicator('contactPerson')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('contactPhone')}
                    className="user-select-none"
                  >
                    Phone
                    {indicator('contactPhone')}
                  </th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('contactEmail')}
                    className="user-select-none"
                  >
                    Email
                    {indicator('contactEmail')}
                  </th>
                  <th scope="col">Address</th>
                  <th
                    scope="col"
                    style={{ cursor: 'pointer' }}
                    onClick={() => sort('country')}
                    className="user-select-none"
                  >
                    Country
                    {indicator('country')}
                  </th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                {pageItems.length === 0 && (
                  <tr>
                    <td colSpan={8} className="text-center py-4 text-muted">
                      No manufacturers found.
                    </td>
                  </tr>
                )}
                {pageItems.map((m) => (
                  <tr key={m.id}>
                    <th scope="row" className="text-muted small">
                      {m.id}
                    </th>
                    <td className="fw-medium">{m.name}</td>
                    <td>{m.contactPerson || '\u2014'}</td>
                    <td className="text-nowrap">{m.contactPhone || '\u2014'}</td>
                    <td>
                      {m.contactEmail ? (
                        <a href={`mailto:${m.contactEmail}`}>{m.contactEmail}</a>
                      ) : (
                        '\u2014'
                      )}
                    </td>
                    <td style={{ maxWidth: 280 }}>
                      {m.address ? (
                        <span className="small text-muted">
                          {m.address.length > 80
                            ? m.address.slice(0, 77) + '...'
                            : m.address}
                        </span>
                      ) : (
                        '\u2014'
                      )}
                    </td>
                    <td className="text-nowrap">{m.country || '\u2014'}</td>
                    <td className="text-nowrap">
                      <div className="d-flex gap-1">
                        <Link
                          to={`/manufacturers/${m.id}/edit`}
                          className="btn btn-outline-primary btn-sm"
                        >
                          Edit
                        </Link>
                        <button
                          type="button"
                          className="btn btn-outline-danger btn-sm"
                          onClick={() => handleDelete(m)}
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
            of <strong>{totalItems}</strong> manufacturers
          </div>
          <nav aria-label="Manufacturers pagination">
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
