import axios from 'axios'

const api = axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
  },
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
