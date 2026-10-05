import { useMemo, useState } from 'react'

export function useSort(items, { sortKey = 'sku', order = 'asc', compareFn } = {}) {
  const [currentSortKey, setSortKey] = useState(sortKey)
  const [currentOrder, setOrder] = useState(order)

  const sort = (key) => {
    if (key === currentSortKey) {
      setOrder((prev) => (prev === 'asc' ? 'desc' : 'asc'))
    } else {
      setSortKey(key)
      setOrder('asc')
    }
  }

  const sorted = useMemo(() => {
    if (!items) return []
    const arr = Array.isArray(items) ? [...items] : []
    arr.sort((a, b) => {
      let av = a[currentSortKey]
      let bv = b[currentSortKey]
      let cmp
      if (compareFn && compareFn[currentSortKey]) {
        cmp = compareFn[currentSortKey](av, bv)
      } else {
        if (av == null) av = ''
        if (bv == null) bv = ''
        if (typeof av === 'number' && typeof bv === 'number') {
          cmp = av - bv
        } else {
          cmp = String(av).localeCompare(String(bv), undefined, {
            numeric: true,
            sensitivity: 'base',
          })
        }
      }
      return currentOrder === 'asc' ? cmp : -cmp
    })
    return arr
  }, [items, currentSortKey, currentOrder, compareFn])

  const indicator = (key) => {
    if (key !== currentSortKey) return '\u00A0\u00A0'
    return currentOrder === 'asc' ? ' \u2191' : ' \u2193'
  }

  return { sorted, sort, currentSortKey, currentOrder, indicator }
}

export function useSearch(items, { filterFn, defaultQuery = '', keys = [] } = {}) {
  const [query, setQuery] = useState(defaultQuery)

  const filtered = useMemo(() => {
    if (!items) return []
    const q = query.trim().toLowerCase()
    if (!q) return items
    if (filterFn) {
      return items.filter((item) => filterFn(item, q))
    }
    if (keys.length === 0) return items
    return items.filter((item) =>
      keys.some((k) => {
        const v = item[k]
        if (v == null) return false
        return String(v).toLowerCase().includes(q)
      }),
    )
  }, [items, query, filterFn, keys])

  return { filtered, query, setQuery }
}

export function usePagination(items, { pageSize = 25, lengthMenu = [10, 25, 50, 100, 250] } = {}) {
  const [currentPageSize, setPageSize] = useState(pageSize)
  const [currentPage, setCurrentPage] = useState(1)

  const totalItems = items ? items.length : 0
  const totalPages = Math.max(1, Math.ceil(totalItems / currentPageSize))

  const safePage = Math.min(Math.max(1, currentPage), totalPages)

  const pageItems = useMemo(() => {
    if (!items) return []
    const start = (safePage - 1) * currentPageSize
    return items.slice(start, start + currentPageSize)
  }, [items, safePage, currentPageSize])

  const startIndex = totalItems === 0 ? 0 : (safePage - 1) * currentPageSize + 1
  const endIndex = Math.min(safePage * currentPageSize, totalItems)

  const goToPage = (n) => {
    setCurrentPage(Math.min(Math.max(1, n), totalPages))
  }

  const changePageSize = (size) => {
    const s = Number(size)
    setPageSize(s)
    setCurrentPage(1)
  }

  const pageNumbers = useMemo(() => {
    const pages = []
    const window = 2
    let start = Math.max(1, safePage - window)
    let end = Math.min(totalPages, safePage + window)
    if (safePage <= window + 1) {
      end = Math.min(totalPages, 2 * window + 1)
    }
    if (safePage >= totalPages - window) {
      start = Math.max(1, totalPages - 2 * window)
    }
    for (let i = start; i <= end; i++) pages.push(i)
    return { start, end, pages }
  }, [safePage, totalPages])

  return {
    pageItems,
    pageSize: currentPageSize,
    setPageSize: changePageSize,
    page: safePage,
    goToPage,
    totalPages,
    totalItems,
    startIndex,
    endIndex,
    lengthMenu,
    pageNumbers,
  }
}
