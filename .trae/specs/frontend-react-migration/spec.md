# Windwah Inventory System - Frontend React.js Migration - Product Requirements Document

## Overview
- **Summary**: Replace the existing Thymeleaf server-side-rendered (SSR) HTML frontend with a React.js single-page application (SPA) frontend served by the same Spring Boot backend, maintaining feature parity with all 5 existing Web UI routes: Products list/detail CRUD, Brands CRUD, Manufacturers CRUD, Export/Submit selection page.
- **Purpose**: Deliver a richer, more interactive client-side experience (reusable React components, client-side routing, better UX for sort/search/pagination state, AJAX-based CRUD with no full-page reloads) while keeping all existing backend business logic, REST APIs, Excel exporters, and PostgreSQL persistence untouched.
- **Target Users**: Inventory operators performing CRUD on 422+ products/Brands/Manufacturers and exporting/submitting to Amazon/eBay marketplaces.

## Goals
- Full feature parity with the 5 current Thymeleaf SSR pages (Products list+form, Brands list+form, Manufacturers list+form, Export/Submit) using React SPA.
- Client-side React Router: routes `/`, `/products`, `/products/new`, `/products/:id/edit`, `/brands`, `/brands/new`, `/brands/:id/edit`, `/manufacturers`, `/manufacturers/new`, `/manufacturers/:id/edit`, `/export` all render inside SPA without page reload.
- Spring Boot backend serves built React production assets from `classpath:/static/` so no separate frontend web server is required at runtime.
- Products table retains: sortable columns (client-side), search box, pagination 10/25/50/100/250, row Edit+Delete action buttons with confirm dialog, image thumbnails, SKU nowrap, numeric right-align — equivalent to current DataTables.net behavior.
- Edit form pre-fills all 15 E-Gate Offer / COBI fields plus base product fields; validates required fields client-side before POST.
- Export page supports per-row checkbox selection, Select-All, 4 action buttons (Amazon/Ebay XLSX download via `<a download>` anchor to GET `/api/export/amazon?ids=...` and Amazon/Ebay POST submit to `/api/submit/{amazon,ebay}?ids=...` with result panel showing SubmissionResult JSON response from REST.
- Static image assets `/extracted_images/**` (416 COBI images) and extracted_image URLs in product records resolve correctly from React (no broken images).
- Existing unit tests (24 JUnit) and backend functionality (REST controllers, service layer, exporters) 100% untouched. No backend regression.
- Development ergonomic: Vite dev proxy + React Fast Refresh on `http://localhost:5173` proxies `/api/**` and `/extracted_images/**` to Spring Boot on `http://localhost:8080` for frontend-only hot-reload iteration.

## Non-Goals
- **Do NOT** change backend Java/Spring code, REST APIs, database schema, or business logic (exception: (1) add CORS config for Vite dev origin http://localhost:5173, (2) register a SPA forward controller mapping non-API routes to `index.html`, (3) update static-locations to include React `dist/`). These three small additions are allowed as infrastructure enabling.
- **Do NOT** change the Amazon 13-column / eBay 16-column Excel export templates or integration clients.
- **Do NOT** implement authentication, authorization, user login, or role-based access control (current Thymeleaf UI has none).
- **Do NOT** implement server-side pagination, infinite scroll, or virtualized tables — keep client-side only pagination/sort/search (422 rows fits easily in browser memory).
- **Do NOT** introduce state management libraries like Redux/Zustand/MobX — React useState + Context API is sufficient for the current feature set.
- **Do NOT** migrate or delete existing Thymeleaf templates during implementation — keep them in repo until React SPA passes independent Review (templates will be marked deprecated or removed only after Review result=pass).
- **Do NOT** add Tailwind CSS, SCSS/sass, or custom theming — reuse Bootstrap 5 (CDN or bootstrap npm package) for consistent component styling matching current visual UX.

## Background & Context
- Current repository state: Spring Boot 3.2.10, PostgreSQL 18, Java 17/21, Maven. Frontend is Thymeleaf SSR templates: 9 HTML files under `src/main/resources/templates/` (products/list.html, products/form.html, brands/*, manufacturers/*, export/page.html, fragments/layout.html) using Bootstrap 5 + jQuery + DataTables.net CDN.
- Existing REST API surface at `/api/**` already provides full CRUD for React SPA consumption:
  - Products: `GET /api/products`, `GET /api/products/{id}`, `POST /api/products`, `PUT /api/products/{id}`, `DELETE /api/products/{id}` — JSON with 36 fields including all 15 E-Gate Offer fields (collection/indexCode/purchasePrice/.../rrpEur/rrpText/availability).
  - Brands: `GET /api/brands`, `GET /api/brands/{id}`, `POST /api/brands`, `PUT /api/brands/{id}`, `DELETE /api/brands/{id}`.
  - Manufacturers: same pattern at `/api/manufacturers`.
  - Export download: `GET /api/export/amazon?ids=...`, `GET /api/export/ebay?ids=...` — returns `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet` byte array with Content-Disposition attachment.
  - Submit API (STUB mode currently): `POST /api/submit/amazon?ids=...`, `POST /api/submit/ebay?ids=...` — returns JSON SubmissionResult.
- Static image serving already in place: `WebMvcConfig#addResourceHandlers` maps `/extracted_images/**` → filesystem `doc/extracted_images/`. Currently resolves correctly in browser.
- Node.js/npm already present on build machine: Node v24.14.0, npm 11.9.0 (PowerShell check 2026-10-05).
- Spring OSIV=false with EntityGraph eager loading — `/api/products` response already fully populated (brandId/brandName/manufacturerId/manufacturerName + all E-Gate fields) for 422 products (JSON array ~ 422KB, well within acceptable SPA initial payload).
- Thin JAR deployment mode (default) means React production build must output to `src/main/resources/static/` (classpath:/static/) so Maven `mvn package` includes assets directly inside thin JAR's classpath; Spring Boot then serves them.

## Functional Requirements
- **FR-1 (SPA Shell)**: Visiting any URL like `/products`, `/products/26/edit`, `/brands/new`, `/export` returns one single `index.html` containing React `<div id="root">` bootstrap, a Navigation bar matching current Thymeleaf layout (Products / Brands / Manufacturers / Add Product / Export links), and a Footer with copyright — no browser page reload occurs between navigation clicks.
- **FR-2 (Products List)**: `/products` renders React client component with:
  - Columns: Image (thumbnail `<a href>` linked to `/extracted_images/...` target=_blank), Index, SKU (`<code>`), Title, Brand, Manufacturer, Collection, Qty, Purchase (dash if null), RRP EUR (dash if null), Availability (colored status badge), Status, Actions.
  - Client-side sortable headers (SKU ascending default). Image/Purchase/RRP/Availability/Actions columns are non-orderable.
  - Client-side search textbox "Search all columns:" — filters on Title/SKU/Brand/Manufacturer/Collection/Status/Index/ListingStatus (exclude numeric price/qty/purchase/rrp + image + actions from search).
  - Pagination: page length dropdown `[10, 25, 50, 100, 250]`, default pageLength=25. Shows "Showing X to Y of N products" info. Page buttons: First/Prev/1…N/Next/Last. Disabled states on first/last edges.
  - Actions column per row: (a) Edit button → React Router push `/products/:id/edit`, (b) Delete button → native confirm dialog `Are you sure you want to delete this product?\nSKU: {sku}\n\nThis cannot be undone.` → DELETE `/api/products/:id` (204 No Content) → refresh list, flash "Product deleted: {sku}" toast.
- **FR-3 (Product Create Form)**: `/products/new` renders create form with all fields matching current Thymeleaf form (base fields + 15 E-Gate Offer fields). Required fields client-side validated (sku*, title*, quantity*, price*). Brand and Manufacturer dropdown selectors populated from GET `/api/brands` / GET `/api/manufacturers` respectively. On submit → POST `/api/products` (201) → redirect to `/products` with success toast. Shows validation errors from server (400 Bad Request) inline per field.
- **FR-4 (Product Edit Form)**: `/products/:id/edit` first fetches GET `/api/products/:id` then pre-fills all 36 form fields (sku is readonly display label not input). On submit → PUT `/api/products/:id` (200) → redirect to `/products` with "Product updated: {sku}" toast.
- **FR-5 (Brands CRUD)**: Equivalent to FR-2/3/4 for Brands at `/brands`, `/brands/new`, `/brands/:id/edit`. Fields: name (required), amazonBrandStoreUrl, logoUrl, description. Table columns: Name, Amazon Store URL, Created At, Updated At, Actions (Edit/Delete).
- **FR-6 (Manufacturers CRUD)**: Equivalent to FR-2/3/4 for Manufacturers at `/manufacturers`, `/manufacturers/new`, `/manufacturers/:id/edit`. Fields: name (required), contactPerson, contactPhone, contactEmail, address, country. Table columns: Name, Contact, Phone, Email, Country, Actions.
- **FR-7 (Export / Submit Page)**: `/export` renders a checkbox-selection table (select all + per-row checkbox for IDs) listing all products with SKU/Title/Qty/Price. Four buttons:
  - **Download Amazon Excel** → `<a>` with `href='/api/export/amazon?ids=1,2,3'` → browser native download.
  - **Download eBay Excel** → same for `/api/export/ebay?ids=...`.
  - **Submit to Amazon API** → POST `/api/submit/amazon?ids=...` (no body) → display returned SubmissionResult JSON (mode, processed count, success, messages) in a result panel.
  - **Submit to eBay API** → same for `/api/submit/ebay`.
- **FR-8 (Flash / Toast messages)**: Success / validation-error / network-error state shown as Bootstrap dismissible alerts at top of page after create/update/delete actions (equivalent to current Thymeleaf flash attributes).
- **FR-9 (Product Image rendering)**: Product list image cells and product form image preview render using product.imageUrls relative URLs (e.g., `/extracted_images/img_A37.png`). If imageUrls is null or empty show "n/a" badge. If 404/not-loaded show broken-image placeholder alt text "No image".

## Non-Functional Requirements
- **NFR-1 (Build integration)**: Running `mvn -q -DskipTests package` (default thin JAR build) should also invoke the Vite production build (`npm run build`) and copy resulting assets from `frontend/dist/` → `src/main/resources/static/` so the final thin JAR contains React assets. Maven `frontend-maven-plugin` or a lightweight PowerShell shell execution via `exec-maven-plugin` is acceptable; goal is deterministic one-command build for production deployment.
- **NFR-2 (No Spring Boot backend regression)**: Running `mvn clean test` after frontend migration must still exit code 0 with 24/24 tests passing (unchanged from current state).
- **NFR-3 (Proxy for frontend dev)**: Vite dev server (port 5173) must proxy: (a) `/api/**` → `http://localhost:8080` (Spring Boot), (b) `/extracted_images/**` → `http://localhost:8080`, enabling Spring Boot backend + Vite frontend to start independently with CORS disabled for dev origin (via backend CorsConfig whitelist of http://localhost:5173).
- **NFR-4 (Initial load ≤ 2s for /products on localhost)**: React SPA shell + React Router hydration must be perceived fast; product data can arrive async with skeleton loader placeholder during GET /api/products fetch.
- **NFR-5 (Browser compatibility baseline)**: Target modern evergreen browsers (Chrome 120+, Edge 120+, Firefox 120+). No IE/legacy support required.
- **NFR-6 (Zero SSR template usage after migration complete)**: After React app is certified working and Review passes, Spring Boot's legacy Thymeleaf controllers (ProductWebController, BrandWebController, ManufacturerWebController, ExportWebController, SubmitWebController) must respond only as deprecated fallback or be removed on explicit user approval. For the initial implementation scope we DO NOT delete or break them — only disable via @ConditionalOnProperty or leave in repo unused with routes returning 302 to React SPA `/` via SPA handler (implementation detail chosen during Plan phase). The explicit transition-out is deferred to after Review.
- **NFR-7 (Dependencies — minimal)**: NPM dependencies limited strictly to: react 18, react-dom 18, react-router-dom 6, axios (native fetch is acceptable too), and bootstrap 5 (CSS only, no peerDependency jQuery needed — we're using React Bootstrap components or plain HTML with Bootstrap classes). Do NOT install DataTables.net jQuery plugin (we implement sort/search/paginate directly in React). Do NOT install react-data-table-component, ag-grid, or any large grid library — native React table with custom client-side helpers is fine for 422 rows.
- **NFR-8 (Thymeleaf starter kept)**: Keep `spring-boot-starter-thymeleaf` Maven dependency until explicit approval to remove (project memory prefers keeping historical audit; we mark it as unused after React fully takes over).

## Constraints
- **Technical**:
  - Backend must remain Spring Boot 3.2.10 Java 17/21 Maven thin JAR (default) + `-Pfat` (still works with React static assets inside).
  - PostgreSQL 18 only — no H2 anywhere in the project (test DB inventory_test on PostgreSQL already enforced by previous migration).
  - Frontend source code inside new repo sub-folder `frontend/` (sibling to `src/`), package.json at `frontend/package.json`. Production build output copied to `src/main/resources/static/`.
  - React 18 functional components + hooks only; no class components. Use Vite 6 with `@vitejs/plugin-react` (SWC) for builds.
  - Use Bootstrap 5 CSS (from npm package `bootstrap` copy css to static or import via Vite entry) — no CDN links in index.html for production (avoids external network at runtime; matches current user requirement of "move frontend to React" with self-contained deploy).
  - No `npm install -g` global installs during build; everything through `npm ci` or `npm install` inside `frontend/` with package-lock checked in.
- **Business**:
  - Brand/Manufacturer normalized FK pattern MUST be preserved in React forms (product form must submit numeric brandId/manufacturerId, not plaintext names). Product auto-create-by-name fallback (from earlier project memory) already exists in service layer for text brand/manufacturer submission; however React UI uses FK dropdowns so this fallback remains only for legacy/direct API calls.
  - Amazon Excel export 13-col (Manufacturer=C col index 2, Brand=D col index 3) and eBay 16-col layout are hard export invariants already verified; NO CHANGES permitted to these exporters.
  - All image URLs stored in product.imageUrls column (single relative path `/extracted_images/...`) must continue to load via same static resource handler — React must NOT prefix/hardcode absolute URLs.
- **Dependencies**:
  - Node.js ≥ 20 LTS (current = 24.14 OK), npm ≥ 10 (current = 11.9 OK).
  - Running PostgreSQL service `postgresql-x64-18` on localhost:5432 for test suite.
  - Running Spring Boot backend on port 8080 during frontend manual dev smoke tests.

## Assumptions
- User environment has internet connectivity for `npm install` (to fetch npm packages from registry.npmjs.org) during build. If offline is required later, provide vendor/ folder; out of scope for this migration.
- The existing `/extracted_images/**` resource handler in WebMvcConfig will work equally when React SPA frontend initiates an HTTP GET for `/extracted_images/img_A37.png` — because both are same-origin in production (Spring Boot serves both index.html and images, CORS irrelevant). In Vite dev mode, the `/extracted_images` proxy covers this.
- `spring.mvc.static-path-pattern` currently set to `/static/**` — we will revert this to Spring Boot default `/**` (or add additional handler) so `index.html`, `assets/*.js`, `assets/*.css` are reachable. This is listed as an allowed infrastructure change in Non-Goals scope (enabling React).
- 422 products returned as one JSON list from GET `/api/products` is acceptable performance-wise. No need to paginate on server for this dataset size.

## Acceptance Criteria

### AC-1: React SPA bootstrap index.html served at root
- **Type**: `rule`
- **Given**: Production build executed (React dist assets copied to `src/main/resources/static/`) and Spring Boot thin JAR started on port 8080.
- **When**: Browser/HTTP client requests GET `http://localhost:8080/` with `Accept: text/html`.
- **Then**: HTTP status 200, response body contains `<div id="root"></div>` and references to React hashed JS/CSS assets (`/assets/index-*.js`, `/assets/index-*.css`), no Thymeleaf template markers.
- **Pass Condition**: `curl -s http://localhost:8080/ | Select-String -Pattern '<div id="root">'` returns ≥ 1 match AND file listing of `src/main/resources/static/assets/*.js` exists ≥ 1 file.
- **Evidence**: curl HTTP 200 snippet + `dir src/main/resources/static/assets` console output.

### AC-2: Deep link / client routing served via SPA forward controller
- **Type**: `rule`
- **Given**: App running same as AC-1.
- **When**: GET `http://localhost:8080/products/26/edit` (with Accept: text/html, simulated browser deep-link).
- **Then**: Server returns the SAME `index.html` payload as GET `/` — not 404, not Thymeleaf template. (React Router on the client then matches `/products/:id/edit` route and fetches product #26 data async from /api/products/26.)
- **Pass Condition**: status 200, `<div id="root">` present.
- **Evidence**: curl output for both URLs compared byte-wise or string-wise for presence of #root div.

### AC-3: Products list renders with correct columns, default sort SKU ASC, paginate 25/page, 17 pages total
- **Type**: `rule`
- **Given**: Running backend with 422 products (417 COBI + 5 original). Browser/headless loads React SPA, navigates to `/products`, waits for products data loaded (no skeleton).
- **When**: DOM snapshot captured.
- **Then**: Products rendered 25 rows on first page, info line shows "Showing 1 to 25 of 422 products", 17 page buttons (422/25 ceil), first row SKU=COBI-1384 (same as current server SKU sort).
- **Pass Condition**: DOM snapshot contains rows > 20 AND < 26, "Showing 1 to 25 of 422 products" string present, pagination list includes pages 1,2,3,17 labels, first rendered row SKU cell = "COBI-1384".
- **Evidence**: Integrated browser MCP snapshot with rows and nav.

### AC-4: Product delete flow end-to-end via React Delete button confirm dialog
- **Type**: `rule`
- **Given**: Fresh test product created via REST with unique SKU "REACT-DELETE-TEST-001", id=X. React SPA products page open, page navigated to show that row (maybe search for its SKU first).
- **When**: Click Delete button → confirm dialog dismissed OK → wait for async DELETE + list refresh.
- **Then**: Row disappears from list, toast "Product deleted: REACT-DELETE-TEST-001" visible, psql COUNT(*) FROM product WHERE sku='REACT-DELETE-TEST-001' returns 0 rows.
- **Pass Condition**: psql count = 0 AND toast message exists in DOM snapshot.
- **Evidence**: psql output + MCP browser snapshot after delete.

### AC-5: Product create + edit persist correctly including 15 E-Gate Offer fields
- **Type**: `rule`
- **Given**: React SPA `/products/new` open. All fields filled: base (sku="REACT-NEW-001", title="Test from React", quantity=7, price=123.45, brand dropdown = brand.id for "華創電子", manufacturer dropdown = manufacturer.id for "華創電子有限公司") + all 15 E-Gate Offer fields (collection="REACT", indexCode="R-001", purchasePrice=60.00, masterCartonPcs=12, boxType="BOX", boxGrossVolumeM3=0.001234, masterCartonGrossVolumeM3=0.123456, boxGrossWeightKg=0.345678, masterCartonGrossWeightKg=4.567890, totalMasterCartonVolumeM3=1.481472, totalMasterCartonWeightKg=54.81468, totalMasterCartonQty=144, rrpEur=199.99, rrpText="RRP 199,99 EUR", availability="AVAILABLE").
- **When**: Submit create form → saved (201) → toast success → auto redirect to `/products` → search "REACT-NEW-001" to locate row → click Edit → in edit form change title to "UPDATED React" → submit save.
- **Then**: psql SELECT title, collection, purchase_price, rrp_eur FROM product WHERE sku='REACT-NEW-001' returns: title="UPDATED React", collection="REACT", purchase_price=60.00, rrp_eur=199.99.
- **Pass Condition**: 4 columns in returned row exactly match expected values.
- **Evidence**: psql row dump after create then after update.

### AC-6: Brands CRUD page works (create → list → edit → delete)
- **Type**: `rule`
- **Given**: Navigate SPA `/brands`.
- **When**: Click "+ Add Brand" → fill name="ReactBrand-001", amazonBrandStoreUrl="https://amazon.example.com/reactbrand-001", description="Brand created in React UI" → save. Return to brands list → click Edit for id → change description to "Updated via React" → save → return → Delete button OK.
- **Then**: Final psql SELECT count(*) FROM brand WHERE name='ReactBrand-001' = 0 (deleted); mid-step after create COUNT = 1; after edit description matches.
- **Pass Condition**: COUNT transitions: 0 → 1 → 1 (update) → 0 (delete), and during update DB description column = "Updated via React".
- **Evidence**: Sequence of psql COUNT / SELECT queries.

### AC-7: Manufacturers CRUD page works
- **Type**: `rule`
- **Given**: Same flow as AC-6 but on `/manufacturers`, name="ReactMfr-001", contactEmail="react@example.com", country="HK".
- **When**: Create → edit country to "CN" → delete.
- **Then**: COUNT transitions correctly, country after edit is "CN".
- **Pass Condition**: same as AC-6, on manufacturer table.
- **Evidence**: psql SELECTs.

### AC-8: Export page - Amazon Excel download uses GET /api/export/amazon?ids=... returns non-empty xlsx bytes
- **Type**: `rule`
- **Given**: React SPA `/export` loaded, checkboxes selected for products with known ids (e.g., 25,26,27 = 3 COBI rows).
- **When**: Click Download Amazon Excel button.
- **Then**: File saved by browser (or `Content-Disposition: attachment` header present on GET), response body length > 1000 bytes (real XLSX), Content-Type = `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`.
- **Pass Condition**: HTTP status 200, Content-Type correct, byte length > 1000.
- **Evidence**: curl `HEAD` or GET response headers + length.

### AC-9: Submit page - Amazon API returns SubmissionResult JSON displayed in UI (STUB mode OK)
- **Type**: `rule`
- **Given**: Same selected ids 25,26,27, amazon.sp-api.enabled=false (STUB — project default).
- **When**: Click Submit to Amazon API in React UI (POST /api/submit/amazon?ids=25,26,27).
- **Then**: Panel rendered showing at minimum: mode="STUB" and processedCount=3. No 500 error.
- **Pass Condition**: UI result panel contains both strings "STUB" and "3" (or processedCount property value ≥ 3).
- **Evidence**: DOM snapshot of result panel.

### AC-10: 422 Product images load in React list (no broken-image placeholders for 416 rows that have URLs)
- **Type**: `rubric`
- **Dimension**: Product image rendering accuracy
- **Scale**: 1-5
- **Anchors**:
  - 1 = Images fail to load (broken `<img>` with no src) for most rows, or wrong URL scheme (file:/// or absolute Windows paths)
  - 3 = Images load for roughly 50% of rows with URLs but several broken / wrong path escaping or missing `/extracted_images` prefix
  - 5 = For a spot-check of 25 rows on a page, all `<img>` src attributes equal the product's imageUrls column value exactly (e.g., `/extracted_images/img_A37.png`), browser network tab shows 200 OK, no 404 responses for image paths. In page DOM only the one SKU COBI-20073 (known to have imageUrls=null) shows "n/a" badge.
- **Pass Threshold**: >= 4
- **Evidence**: Browser MCP snapshot of list showing alt-text rendered correctly, plus curl HEAD on a sample img src returning 200 with Content-Type image/png OR image/jpeg.

### AC-11: Client-side search, sort, pagination UX quality (productivity)
- **Type**: `rubric`
- **Dimension**: Interactive UX quality (search/sort/pagination)
- **Scale**: 1-5
- **Anchors**:
  - 1 = Search does not work / sort does nothing / pagination clicks do not change visible rows
  - 3 = Works but feels slow/janky (filter lag on 422 rows > 250ms, clicks need double click, page info not updating), several non-sortable columns still have sort-click handlers or sort incorrectly
  - 5 = Immediate responsive: typing "COBI-6281" in search filters to exactly 1 row within ~100ms; click Title header twice → sorts asc then desc correctly; page length dropdown switches instantly (changing from 25→100 shows 100 rows); page numbers 2,3,4 navigation all correct; disabled-state buttons correct on page 1 (First/Prev disabled) and last page (Next/Last disabled).
- **Pass Threshold**: >= 4
- **Evidence**: Manual test sequence with browser snapshots showing before/after state of search filter by SKU, sort arrow indicators, page length 100 rows.

### AC-12: Vite dev server proxy works for /api/** + /extracted_images/**
- **Type**: `rule`
- **Given**: Spring Boot backend running on port 8080; Vite dev server running `npm run dev` on port 5173 from `frontend/`.
- **When**: Browser fetches `http://localhost:5173/api/products` through Vite (or from React SPA fetch triggered by visiting 5173/products page). Also fetch `http://localhost:5173/extracted_images/img_A12.png`.
- **Then**: /api/products returns JSON 200 (422 length) without CORS errors. /extracted_images/img_A12.png returns image/png 200.
- **Pass Condition**: status 200 for both URLs when hitting port 5173 (Vite proxy).
- **Evidence**: PowerShell `Invoke-WebRequest -Uri http://localhost:5173/api/products` status 200 + content length > 400,000 bytes; 2nd for img with Content-Type image/png.

### AC-13: mvn clean test 24/24 still passing (no backend regression)
- **Type**: `rule`
- **Given**: React frontend migration code committed/built locally (and any backend enabling changes applied — CorsConfig, SpaController, static-locations adjustment).
- **When**: Run `mvn clean test`.
- **Then**: Exit code 0, surefire summary "Tests run: 24, Failures: 0, Errors: 0, Skipped: 0".
- **Pass Condition**: exact string match "Tests run: 24, Failures: 0, Errors: 0, Skipped: 0".
- **Evidence**: Maven test log snippet with BUILD SUCCESS line and final counts line.

### AC-14: Production build — `mvn -DskipTests package` succeeds and thin JAR contains React static assets
- **Type**: `rule`
- **Given**: Clean working directory, npm packages installed in frontend/ (node_modules populated).
- **When**: Execute `mvn -DskipTests package`.
- **Then**:
  - Maven exits 0.
  - After build, `target/classes/static/index.html` exists AND contains `<div id="root">`.
  - After build, ≥ 1 file exists matching `target/classes/static/assets/index-*.js`.
- **Pass Condition**: All three sub-conditions true simultaneously.
- **Evidence**: dir listing of `target/classes/static/` + `jar tf target/inventory-0.1.0-SNAPSHOT.jar | findstr "static/index"` (jar contains assets).

## Open Questions
- [ ] **Removal of legacy Thymeleaf templates**: After React SPA is independently verified and Review=pass, does the user want to (a) delete 9 HTML template files + 5 WebController classes entirely, (b) keep them around but mark with @Deprecated comment and not route new traffic, or (c) keep them as fallback with a feature-flag switch `app.legacy-ui.enabled=true` in application.properties? This question has been deferred to post-Review decision by NFR-6, but noting explicitly for approval record.
- [ ] **Use of React Bootstrap components vs plain HTML + Bootstrap classes**: Both approaches acceptable. Is there a preference to NOT add `react-bootstrap` npm package (keep dep count minimal — just bootstrap CSS import) or is react-bootstrap desired for form inputs/modal/alert/table? Default assumption (per NFR-7) is plain HTML + bootstrap CSS only, no react-bootstrap package.
