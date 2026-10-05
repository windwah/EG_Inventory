import { useToasts } from '../context/AppContext'

const variantClass = (variant) => {
  switch (variant) {
    case 'success':
      return 'alert-success'
    case 'danger':
      return 'alert-danger'
    case 'warning':
      return 'alert-warning'
    case 'info':
    default:
      return 'alert-info'
  }
}

export default function ToastAlerts() {
  const { toasts, removeToast } = useToasts()
  if (!toasts.length) return null
  return (
    <div
      className="toast-container position-fixed top-0 end-0 p-3"
      style={{ zIndex: 1080 }}
    >
      {toasts.map((t) => (
        <div
          key={t.id}
          className={`alert ${variantClass(t.variant)} alert-dismissible mb-2 fade show shadow`}
          role="alert"
        >
          <div style={{ whiteSpace: 'pre-wrap' }}>{t.message}</div>
          <button
            type="button"
            className="btn-close"
            aria-label="Close"
            onClick={() => removeToast(t.id)}
          />
        </div>
      ))}
    </div>
  )
}
