import { createContext, useCallback, useContext, useMemo, useState } from 'react'

const AppContext = createContext(null)

let toastIdCounter = 0

export function ToastProvider({ children }) {
  const [toasts, setToasts] = useState([])

  const removeToast = useCallback((id) => {
    setToasts((prev) => prev.filter((t) => t.id !== id))
  }, [])

  const pushToast = useCallback(
    (message, variant = 'info', autoDismissMs = 5000) => {
      const id = ++toastIdCounter
      const toast = { id, message, variant, autoDismissMs }
      setToasts((prev) => [...prev, toast])
      if (autoDismissMs && autoDismissMs > 0) {
        setTimeout(() => {
          setToasts((prev) => prev.filter((t) => t.id !== id))
        }, autoDismissMs)
      }
      return id
    },
    [],
  )

  const value = useMemo(
    () => ({ toasts, pushToast, removeToast }),
    [toasts, pushToast, removeToast],
  )

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>
}

export function useToasts() {
  const ctx = useContext(AppContext)
  if (!ctx) {
    throw new Error('useToasts must be used within a ToastProvider')
  }
  return ctx
}
