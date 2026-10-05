import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom'
import Navbar from './components/Navbar'
import Footer from './components/Footer'
import ToastAlerts from './components/ToastAlerts'
import { ToastProvider } from './context/AppContext'
import ProductList from './pages/ProductList'
import ProductForm from './pages/ProductForm'
import BrandList from './pages/BrandList'
import BrandForm from './pages/BrandForm'
import ManufacturerList from './pages/ManufacturerList'
import ManufacturerForm from './pages/ManufacturerForm'
import ExportPage from './pages/ExportPage'
import NotFound from './pages/NotFound'

export default function App() {
  return (
    <BrowserRouter>
      <ToastProvider>
        <div className="d-flex flex-column min-vh-100 bg-body-tertiary">
          <Navbar />
          <main className="flex-shrink-0">
            <div className="container-fluid">
              <Routes>
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
              </Routes>
            </div>
          </main>
          <Footer />
          <ToastAlerts />
        </div>
      </ToastProvider>
    </BrowserRouter>
  )
}
