import { NavLink } from 'react-router-dom'

export default function Navbar() {
  const linkClass = ({ isActive }) =>
    'nav-link' + (isActive ? ' active' : '')

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
          <ul className="navbar-nav">
            <li className="nav-item">
              <NavLink
                className="btn btn-outline-light btn-sm ms-lg-2 mt-2 mt-lg-0"
                to="/products/new"
              >
                + Add Product
              </NavLink>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  )
}
