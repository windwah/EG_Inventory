import { NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

export default function Navbar() {
  const { user, canEdit, logout } = useAuth()
  const navigate = useNavigate()

  const linkClass = ({ isActive }) =>
    'nav-link' + (isActive ? ' active' : '')

  const handleLogout = async () => {
    await logout()
    navigate('/login', { replace: true })
  }

  return (
    <nav className="navbar navbar-expand-lg bg-primary navbar-dark mb-4 shadow-sm">
      <div className="container-fluid">
        <NavLink className="navbar-brand fw-bold" to="/products">
          E-Gate Inventory
        </NavLink>
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mainNavbar"
          aria-controls="mainNavbar"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon" />
        </button>
        <div className="collapse navbar-collapse" id="mainNavbar">
          <ul className="navbar-nav me-auto">
            <li className="nav-item">
              <NavLink className={linkClass} to="/products">
                Products
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className={linkClass} to="/brands">
                Brands
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className={linkClass} to="/manufacturers">
                Manufacturers
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className={linkClass} to="/export">
                Export / Submit
              </NavLink>
            </li>
          </ul>
          <ul className="navbar-nav align-items-lg-center">
            {canEdit && (
              <li className="nav-item">
                <NavLink
                  className="btn btn-outline-light btn-sm ms-lg-2 mt-2 mt-lg-0"
                  to="/products/new"
                >
                  + Add Product
                </NavLink>
              </li>
            )}
            {user && (
              <li className="nav-item ms-lg-3 mt-2 mt-lg-0 d-flex align-items-center gap-2">
                <span className="navbar-text text-white-50 small">
                  {user.displayName}
                  <span className="badge bg-light text-primary ms-2">
                    {user.roleLabel || user.role}
                  </span>
                </span>
                <button
                  type="button"
                  className="btn btn-outline-light btn-sm"
                  onClick={handleLogout}
                >
                  Sign out
                </button>
              </li>
            )}
          </ul>
        </div>
      </div>
    </nav>
  )
}
