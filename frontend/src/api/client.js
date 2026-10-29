import axios from 'axios'

const api = axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
  },
})

const readCookie = (name) => {
  const match = document.cookie.match(new RegExp('(^|;\\s*)' + name + '=([^;]*)'))
  return match ? decodeURIComponent(match[2]) : null
}

// Spring Security writes the raw CSRF token to the XSRF-TOKEN cookie; every
// state-changing request must echo it back in the X-XSRF-TOKEN header.
api.interceptors.request.use((config) => {
  const method = (config.method || 'get').toUpperCase()
  if (!['GET', 'HEAD', 'OPTIONS', 'TRACE'].includes(method)) {
    const token = readCookie('XSRF-TOKEN')
    if (token) {
      config.headers['X-XSRF-TOKEN'] = token
    }
  }
  return config
})

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response) {
      const status = error.response.status
      const data = error.response.data
      if (status === 400 && data) {
        if (typeof data === 'object' && !Array.isArray(data)) {
          const fieldErrors = {}
          Object.keys(data).forEach((k) => {
            const v = data[k]
            fieldErrors[k] = Array.isArray(v) ? v[0] : String(v)
          })
          error.fieldErrors = fieldErrors
          error.genericMessage = null
        } else if (typeof data === 'string') {
          error.genericMessage = data
        } else {
          error.genericMessage =
            (data && data.message) ||
            'Validation failed, please review your input.'
        }
      } else if (status >= 500) {
        error.genericMessage =
          'Server error occurred. Please try again or contact support.'
      } else if (status === 404) {
        error.genericMessage = 'Resource not found.'
      } else if (status === 409) {
        error.genericMessage =
          (data && data.message) || 'Conflict: duplicate or invalid state.'
      } else if (status === 401) {
        error.genericMessage =
          (data && data.message) || 'Your session has expired. Please sign in again.'
      } else {
        error.genericMessage =
          (data && data.message) ||
          `Request failed with status ${status}.`
      }
    } else if (error.request) {
      error.genericMessage =
        'Network error. Please check your connection and try again.'
    } else {
      error.genericMessage = error.message || 'Unexpected error.'
    }
    return Promise.reject(error)
  },
)

export default api
