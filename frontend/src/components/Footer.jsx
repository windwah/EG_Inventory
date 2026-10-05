export default function Footer() {
  const year = new Date().getFullYear()
  return (
    <footer className="mt-5 py-4 bg-light border-top">
      <div className="container text-center text-muted small">
        <div>
          &copy; {year} Windwah E-Gate Inventory System &middot; Built with
          Spring Boot + React
        </div>
      </div>
    </footer>
  )
}
