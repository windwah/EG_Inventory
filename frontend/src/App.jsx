import { BrowserRouter, Navigate, Outlet, Route, Routes } from 'react-router-dom'
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import ToastAlerts from './components/ToastAlerts'
import ProtectedRoute from './components/ProtectedRoute'
import { ToastProvider } from './context/AppContext'
import { AuthProvider } from './context/AuthContext'
import Login from './pages/Login'
import ProductList from './pages/ProductList'
import ProductForm from './pages/ProductForm'
import BrandList from './pages/BrandList'
import BrandForm from './pages/BrandForm'
import ManufacturerList from './pages/ManufacturerList'
import ManufacturerForm from './pages/ManufacturerForm'
import ExportPage from './pages/ExportPage'
import NotFound from './pages/NotFound'

function AppShell() {
  return (
    <ProtectedRoute>
      <div className="d-flex flex-column min-vh-100 bg-body-tertiary">
        <Navbar />
        <main className="flex-shrink-0">
          <div className="container-fluid">
            <Outlet />
          </div>
        </main>
        <Footer />
      </div>
    </ProtectedRoute>
  )
}

export default function App() {
  return (
    <BrowserRouter>
      <ToastProvider>
        <AuthProvider>
          <Routes>
            <Route path="/login" element={<Login />} />
            <Route element={<AppShell />}>
              <Route path="/" element={<Navigate to="/products" replace />} />
              <Route path="/products" element={<ProductList />} />
              <Route path="/products/new" element={<ProductForm mode="create" />} />
              <Route path="/products/:id/edit" element={<ProductForm mode="edit" />} />
              <Route path="/brands" element={<BrandList />} />
              <Route path="/brands/new" element={<BrandForm mode="create" />} />
              <Route path="/brands/:id/edit" element={<BrandForm mode="edit" />} />
              <Route path="/manufacturers" element={<ManufacturerList />} />
              <Route path="/manufacturers/new" element={<ManufacturerForm mode="create" />} />
              <Route path="/manufacturers/:id/edit" element={<ManufacturerForm mode="edit" />} />
              <Route path="/export" element={<ExportPage />} />
              <Route path="*" element={<NotFound />} />
            </Route>
          </Routes>
          <ToastAlerts />
        </AuthProvider>
      </ToastProvider>
    </BrowserRouter>
  )
}
