import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
} from 'react'
import api from '../api/client'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null)
  const [loading, setLoading] = useState(true)

  const refresh = useCallback(async () => {
    try {
      const res = await api.get('/auth/me')
      setUser(res.data)
      return res.data
    } catch {
      setUser(null)
      return null
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    refresh()
  }, [refresh])

  const login = useCallback(async (username, password) => {
    const res = await api.post('/auth/login', { username, password })
    setUser(res.data)
    return res.data
  }, [])

  const logout = useCallback(async () => {
    try {
      await api.post('/auth/logout')
    } catch {
      // The local session is cleared even if the server call fails.
    }
    setUser(null)
  }, [])

  const value = useMemo(() => {
    const role = user?.role || null
    return {
      user,
      role,
      loading,
      login,
      logout,
      refresh,
      isAuthenticated: Boolean(user),
      isAdmin: role === 'ROLE_ADMIN',
      canEdit: role === 'ROLE_ADMIN' || role === 'ROLE_EDITOR',
      hasRole: (...roles) => roles.includes(role),
    }
  }, [user, loading, login, logout, refresh])

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return ctx
}
