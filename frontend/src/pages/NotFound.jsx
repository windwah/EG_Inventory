import { Link } from 'react-router-dom'

export default function NotFound() {
  return (
    <div className="container py-5">
      <div className="row justify-content-center">
        <div className="col-md-8 col-lg-6">
          <div className="card shadow-sm">
            <div className="card-body text-center py-5">
              <h1 className="display-3 fw-bold text-muted">404</h1>
              <p className="lead mt-2">Page not found</p>
              <p className="text-muted mb-4">
                The page you are looking for does not exist or has been moved.
              </p>
              <Link to="/products" className="btn btn-primary">
                Back to Products
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
