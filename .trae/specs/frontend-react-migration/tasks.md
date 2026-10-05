# Windwah Inventory System - Frontend React.js Migration - Implementation Plan

## Task 1: Backend Spring infrastructure for SPA
- **Status**: `pending`
- **Priority**: high
- **Depends On**: None
- **Description**:
  - (1a) Create new class `com.windwah.inventory.config.SpaWebConfig` implementing `WebMvcConfigurer` that:
    - **Registers CORS mapping** for Vite dev origin http://localhost:5173 with allowedMethods=*, allowedHeaders=*, allowCredentials=false, maxAge=3600, allowedOrigins exactly http://localhost:5173 only. (No open CORS, whitelist only.)
    - **Adds forward view controller**: forward unmatched non-API GET requests (routes like `/`, `/products`, `/products/26/edit`, `/brands/new`, `/export`) to `forward:/index.html`. Use `ViewControllerRegistry#addViewController` with pattern matching — do NOT forward paths starting with `/api/**`, `/extracted_images/**`, `/h2-console/**`, `/actuator/**`, or paths that already end in a file extension (`.js`, `.css`, `.png`, `.jpg`, `.svg`, `.ico`, `.map`, `.woff2`, etc.) to avoid serving index.html where static assets exist.
    - Fixes `spring.mvc.static-path-pattern` setting: change from `/static/**` (current) back to Spring Boot default `/**` so `src/main/resources/static/index.html` and `static/assets/*` are served directly. This property change is written in application.properties (not Java code). Note: this may affect any existing /static/* path conventions if used anywhere else; verify no other code relies on /static prefix after the change.
  - (1b) Create convenience `frontend/` directory marker `.gitkeep` initially.
- **Acceptance Criteria Addressed**: AC-1 (index.html served), AC-2 (deep links forward to SPA), AC-12 (CORS for Vite 5173)
- **Test Requirements**:
  - `rule` TR-1.1: `curl -s http://localhost:8080/nonexistent-page-without-api-prefix | Select-String 'id="root"'` returns a match (SPA forwarder works on unknown route too).
  - `rule` TR-1.2: `curl -I http://localhost:5173/api/products` returns status 200 (actually requires Task 4 + Task 7 running together; here we verify via backend CORS preflight: `curl -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' http://localhost:8080/api/products` → response contains `Access-Control-Allow-Origin: http://localhost:5173` + `200` or `403`/`204` acceptable with allow header present).
  - `rule` TR-1.3: application.properties key `spring.mvc.static-path-pattern` is either removed or set to `/**`; reading file confirms the old `/static/**` value is no longer active.
- **Notes**: This is backend-only enabling work; no React code yet.

## Task 2: Vite + React project scaffolding
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 1 (backend enabling, but mostly independent — can be done concurrently in practice; must finish before Task 3)
- **Description**:
  - Initialize Vite React project in new `frontend/` folder:
    - Run `npm create vite@latest . -- --template react` FROM WITHIN `frontend/` directory (cd frontend then run command — accepts prompts).
    - After scaffold: verify package.json has scripts `"dev": "vite"`, `"build": "vite build"`, `"preview": "vite preview"`.
    - Install dependencies: `npm install react-router-dom axios bootstrap` (exact versions OK latest non-beta).
    - Remove Vite boilerplate `src/App.css` unused cruft; keep `src/index.css` minimal or empty (bootstrap import will replace it).
    - Add to existing `vite.config.js`: `server.proxy` object with: `/api` → `http://localhost:8080` (changeOrigin: true), `/extracted_images` → `http://localhost:8080` (changeOrigin: true).
    - Create entry `src/main.jsx`: imports `bootstrap/dist/css/bootstrap.min.css` before React StrictMode render so Bootstrap CDN not needed.
  - Configure Vite `build.outDir` to `'dist'` (default) AND configure `base: './'` if needed so relative asset URLs are portable; or keep default base='/' since Spring Boot serves from context root.
  - Check package-lock.json into repo (`frontend/package-lock.json`).
- **Acceptance Criteria Addressed**: AC-12 (vite proxy + CORS), AC-14 (build produces dist)
- **Test Requirements**:
  - `rule` TR-2.1: `frontend/package.json` exists with scripts, `frontend/vite.config.js` exports `server.proxy` with at least `/api` rule.
  - `rule` TR-2.2: After `cd frontend ; npm run build` run → `frontend/dist/assets/index-*.js` and `frontend/dist/index.html` exist with file size > 0 (index.html > 200 bytes, js bundle > 50KB).
  - `rule` TR-2.3: `frontend/src/main.jsx` contains literal string `bootstrap/dist/css/bootstrap.min.css` (ensures CSS loaded, no external CDN).
- **Notes**: Manual npm commands from terminal; subagent execution needs proper working directory setting.

## Task 3: React SPA shell + React Router routes
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 2
- **Description**:
  - Replace `src/App.jsx` with layout component: `<Navbar>` + `<Routes>` + `<Footer>` with Bootstrap styling (same nav items as Thymeleaf layout.html).
  - Add routes (BrowserRouter basename '/'):
    - `/` → redirect to `/products`
    - `/products` → `<ProductList />`
    - `/products/new` → `<ProductForm mode="create" />`
    - `/products/:id/edit` → `<ProductForm mode="edit" />`
    - `/brands` → `<BrandList />`
    - `/brands/new` → `<BrandForm mode="create" />`
    - `/brands/:id/edit` → `<BrandForm mode="edit" />`
    - `/manufacturers` → `<ManufacturerList />`
    - `/manufacturers/new` → `<ManufacturerForm mode="create" />`
    - `/manufacturers/:id/edit` → `<ManufacturerForm mode="edit" />`
    - `/export` → `<ExportPage />`
    - `*` → 404 Not Found simple page with Bootstrap card
  - Create shared components:
    - `components/Navbar.jsx` - Brand link, 5 nav links, bg-primary Bootstrap 5 classes matching current SSR nav.
    - `components/Footer.jsx` - Copyright bar
    - `components/ToastAlerts.jsx` - Bootstrap alert container (stack position top-right) showing success/error toasts; use React Context (`AppContext.jsx` ToastProvider hook) to push/pop toasts from any page.
    - `api/client.js` - Axios instance with baseURL='/api' (works both Vite proxy + production same-origin). Interceptor for 400 validation errors unwraps message. Interceptor for 5xx triggers error toast.
- **Acceptance Criteria Addressed**: AC-1, AC-2, AC-8 (toast infrastructure), FR-1
- **Test Requirements**:
  - `rule` TR-3.1: `frontend/src/App.jsx` imports and declares routes for all 13+ URL paths in list above (grep count of Route components).
  - `rule` TR-3.2: `frontend/src/api/client.js` exports axios instance with default baseURL `/api` or `'http://localhost:5173/api'` or import.meta.env pattern that resolves to relative `/api` in build.
  - `rule` TR-3.3: `frontend/src/components/ToastAlerts.jsx` contains Bootstrap alert-classes strings `alert-success`, `alert-danger`, `alert-info`.
- **Notes**: Axios can be swapped for native fetch with a tiny wrapper if axios is problematic; default plan uses axios for simplicity (validation error extraction easier).

## Task 4: Product List page with client-side sort/search/pagination + Edit/Delete action buttons
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 3
- **Description**:
  - New file `pages/products/ProductList.jsx`:
    - Fetches GET `/products` on mount via api client → stores in state `products` array.
    - Helper modules (file `utils/table.js`): client-side useSort hook (default sortKey=sku, order=asc), useSearch hook (filterFn searches Title/SKU/Brand/Manufacturer/Collection/ListingStatus/Index — NOT purchase/qty/rrp/imageIds/actions), usePagination hook (default pageSize=25, lengthMenu=[10,25,50,100,250]).
    - Render `<table class="table table-striped table-hover align-middle">` with 13 `<th>`s matching current list.html.
      - Column orderability: headers Image/Purchase/RRP/Availability/Actions non-clickable (non-orderable). Others clickable with sort indicator arrow (asc ▲ / desc ▼).
      - Column searchability: same exclusion list as mentioned.
      - Numeric alignment: Qty/Purchase/RRP columns → `<td className="text-end">`.
      - Column widths: Image narrow (60px max-width), Actions wide enough for two buttons, nowrap on SKU/Index/Status/Actions via `className="text-nowrap"`.
    - Image cell: if p.imageUrls present → `<a href={p.imageUrls} target="_blank"><img src={p.imageUrls} alt={p.sku} style={{maxWidth:'60px', maxHeight:'60px'}} className="img-thumbnail"/></a>`, else `<span className="badge bg-light text-muted">n/a</span>`.
    - Availability cell: color-coded badges (AVAILABLE → success/green, NEW PRODUCTION → warning/yellow, date-based → info/blue, else → secondary/gray).
    - RRP EUR / Purchase cells: render `EUR X.XX` formatted if non-null, else em-dash `—`.
    - Actions cell:
      - Edit btn: `<Link to={`/products/${p.id}/edit`} className="btn btn-sm btn-outline-primary">Edit</Link>`
      - Delete btn: `<button class="btn btn-sm btn-outline-danger" onClick={() => handleDelete(p)}>Delete</button>` where handleDelete calls `window.confirm()` with SKU message then DELETE via api client, then re-splice products array, push toast "Product deleted: sku".
    - Top controls: page length dropdown (select with options 10/25/50/100/250), search input `<input placeholder="Search all columns:" />`.
    - Bottom controls: info line "Showing X to Y of N products", Bootstrap pagination `<ul class="pagination">` First/«, Prev/‹, 1..17 pages, Next/›, Last/» — with disabled classes on edges.
- **Acceptance Criteria Addressed**: AC-3 (rows 25/page, 17 pages, sort SKU asc), AC-4 (delete button flow end-to-end), AC-10 (images rendering), AC-11 (interactive quality)
- **Test Requirements**:
  - `rule` TR-4.1: ProductList uses utils/table.js hooks with pageSize default 25, sortKey='sku', order='asc'.
  - `rule` TR-4.2: Delete handler on click calls a confirm dialog pattern (check for `window.confirm` string in code) and then invokes axios DELETE against `/products/{id}`.
  - `rubric` TR-4.3: Table rendering quality; scale 1-5; anchors 1=broken 3=functional 5=matches current Thymeleaf/Datatables layout pixel-similar (colors, badges, button sizes); threshold >= 4; evidence = browser MCP snapshot of page 1 of products.
- **Notes**: Build client-side utilities in single utils file to reduce boilerplate; BrandList + ManufacturerList will also import them.

## Task 5: Product Create & Edit Form (36 fields including 15 E-Gate)
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 4 (can start as soon as Task 3 ready; Task 4 completion not strictly needed but shared toast context needed)
- **Description**:
  - New file `pages/products/ProductForm.jsx`:
    - Component accepts mode='create'|'edit' via React Router useParams() id presence → mode derive logic.
    - Initial form state object with all fields matching ProductCreateRequest DTO (sku, title, description, quantity, price, currency, upc, ean, mpn, brandId, manufacturerId, brand, manufacturer, category, condition, imageUrls, weightKg, dimensions, listingStatus, collection, indexCode, purchasePrice, masterCartonPcs, boxType, boxGrossVolumeM3, masterCartonGrossVolumeM3, boxGrossWeightKg, masterCartonGrossWeightKg, totalMasterCartonVolumeM3, totalMasterCartonWeightKg, totalMasterCartonQty, rrpEur, rrpText, availability).
    - On mount (edit mode): GET `/products/:id` → populate form.
    - On mount: fetch brands list + manufacturers list to populate `<select>` dropdowns.
    - Render form `<form className="row g-3">` (Bootstrap form layout grid same as Thymeleaf form.html):
      - Fieldset 1 - Base product fields: SKU (readonly in edit mode), Title, Brand select + OR text fallback input, Manufacturer select + OR text fallback input, Description textarea, Quantity (number min=0), Price (number step 0.01 min 0.01), Currency, Condition dropdown, UPC/EAN/MPN, Category, Image URLs, Weight kg, Dimensions, Listing Status dropdown.
      - Fieldset 2 - E-Gate Offer / COBI fields (15 fields): `<hr><h6>E-Gate Offer / COBI fields</h6>` followed by inputs: Collection (text), IndexCode (text), PurchasePrice (step 0.01), MasterCartonPcs (int step 1), BoxType (text max), BoxGrossVolumeM3 (step 0.000001), MasterCartonGrossVolumeM3 (step 0.000001), BoxGrossWeightKg (step 0.000001), MasterCartonGrossWeightKg (step 0.000001), TotalMasterCartonVolumeM3 (step 0.000001), TotalMasterCartonWeightKg (step 0.000001), TotalMasterCartonQty (int), RrpEur (step 0.01), RrpText (text), Availability (text placeholder hint).
    - Client validation before submit: sku (required in create mode only), title required, quantity required and integer >=0, price required > 0. Show small validation error divs below each field if client-side validation fails OR server returns 400 with field errors.
    - Submit: mode=create → POST `/products`, mode=edit → PUT `/products/:id`. On success, navigate to `/products` with success toast. On validation fail, show errors inline, no navigation.
    - Condition enum dropdown options: NEW / USED_LIKE_NEW / USED_VERY_GOOD / USED_GOOD / ACCEPTABLE (labels match current form.html select values). ListingStatus enum: ACTIVE / INACTIVE / DRAFT.
- **Acceptance Criteria Addressed**: AC-5 (create then edit 15 E-Gate fields persist correctly via psql check)
- **Test Requirements**:
  - `rule` TR-5.1: ProductForm renders all 15 E-Gate field names (exact match for 15 property keys: collection,indexCode,purchasePrice,masterCartonPcs,boxType,boxGrossVolumeM3,masterCartonGrossVolumeM3,boxGrossWeightKg,masterCartonGrossWeightKg,totalMasterCartonVolumeM3,totalMasterCartonWeightKg,totalMasterCartonQty,rrpEur,rrpText,availability — count presence of strings equals exactly 15 unique keys).
  - `rule` TR-5.2: In edit mode, JSX contains `readOnly` prop or `disabled` prop on SKU input (grep for `readOnly` combined with SKU field comment — or conditionally render `<span className="form-control-plaintext">{form.sku}</span>` when id exists).
  - `rubric` TR-5.3: Form layout usability (labels/structure matches current Thymeleaf form.html); scale 1-5 threshold>=4; evidence=browser snapshot with E-Gate section heading visible.
- **Notes**: The `brand` text fallback (auto-create by name in service) and `manufacturer` text fallback exist already in backend; product form should render both dropdown (primary, preferred) and a text input (fallback) just like current Thymeleaf form.

## Task 6: Brands + Manufacturers CRUD pages (React equivalents of Thymeleaf lists/forms)
- **Status**: `pending`
- **Priority**: medium
- **Depends On**: Task 4 (shared table utilities) and Task 5 (shared form patterns / toast context)
- **Description**:
  - `pages/brands/BrandList.jsx`: fetch GET `/brands`, render table Name|Amazon Store Url|Description|Created At|Updated At|Actions (Edit/Delete). Plus link "+ Add Brand" in top right.
  - `pages/brands/BrandForm.jsx`: create/edit with fields name (required, max 128), amazonBrandStoreUrl (max 255), logoUrl (max 2048), description (textarea 2000).
  - `pages/manufacturers/ManufacturerList.jsx`: render table Name|Contact Person|Phone|Email|Address|Country|Actions.
  - `pages/manufacturers/ManufacturerForm.jsx`: create/edit with fields name (required 128), contactPerson (128), contactPhone (64), contactEmail (128 type=email), address (500), country (64).
  - Use same toast patterns, delete confirm, create/edit redirect as Product pages (code share / re-use table utilities from Task 4).
- **Acceptance Criteria Addressed**: AC-6 (Brand CRUD: create→edit→delete→0), AC-7 (Manufacturer same)
- **Test Requirements**:
  - `rule` TR-6.1: 4 page files exist (BrandList.jsx, BrandForm.jsx, ManufacturerList.jsx, ManufacturerForm.jsx), each imports axios client OR fetches from respective endpoint `/brands` or `/manufacturers`.
  - `rule` TR-6.2: Manufacturer form has `type="email"` on contactEmail input.
- **Notes**: Lower priority than Product pages but still required for full feature parity; can be delegated to a subagent if they can share the table utilities written in Task 4.

## Task 7: Export / Submit Page (selection checkboxes, 4 action buttons, result panel, XLSX download)
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 3 (shell)
- **Description**:
  - New file `pages/ExportPage.jsx`:
    - On mount fetches GET `/products` (or lighter endpoint; full list OK since 422 rows) → products table for selection.
    - State `selectedIds` (Set).
    - Checkbox column at left + header Select-All checkbox (indeterminate when partial select).
    - Columns: checkbox, SKU, Title, Qty, Price (currency formatted).
    - 4 buttons below:
      1. **Download Amazon Excel**: `const url = '/api/export/amazon?ids='+Array.from(selectedIds).join(','); window.location.href = url;` (native browser download with Content-Disposition: attachment, no axios needed — avoids Blob complexity).
      2. **Download eBay Excel**: same pattern `/api/export/ebay?ids=...`.
      3. **Submit to Amazon API** (only enabled when selectedIds.size>0): POST `/submit/amazon?ids=...` via axios client (empty body) → capture response SubmissionResult JSON → populate `submissionResult` state → render card panel with fields: Mode, Processed Count, Success flag, Messages list (if any).
      4. **Submit to eBay API** same with `/submit/ebay`.
    - If selectedIds empty, buttons disabled with tooltip or disabled state.
- **Acceptance Criteria Addressed**: AC-8 (Amazon Excel download with correct headers + byte length >1K), AC-9 (SubmissionResult panel shows STUB mode + 3 processed)
- **Test Requirements**:
  - `rule` TR-7.1: ExportPage button click handler uses `window.location.href` with `/api/export/amazon` or `/api/export/ebay` pattern, passing comma-separated ids query string.
  - `rule` TR-7.2: Submit handler for Amazon calls axios POST on `/submit/amazon` (no body) and sets result state that is rendered within a card/div containing the strings "STUB" or "PRODUCTION" from returned mode.
- **Notes**: No changes needed to backend controllers; GET endpoint already receives List<Long> ids via @RequestParam.

## Task 8: Build integration - Vite build copies output into Spring Boot classpath static + Maven hook
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 4-7 (React pages complete) + Task 2 (scaffold)
- **Description**:
  - Option A (exec-maven-plugin with explicit PowerShell script fallback): add `exec-maven-plugin` execution in pom.xml, phase=generate-resources or process-classes, goals=[exec], configuration executes: (1) first `npm ci` or `npm install` in frontend/ if node_modules absent; (2) `npm run build` in frontend/; (3) copy `frontend/dist/**` → `src/main/resources/static/` using maven-resources-plugin copy-resources execution, or alternatively add frontend/dist to spring.resources.static-locations list directly in application.properties so no copy needed. Latter option is cleaner and deterministic:
    - **Chosen**: Add to application.properties: `spring.web.resources.static-locations=classpath:/static/,file:./frontend/dist/` so in dev mode Spring can also look at the raw frontend/dist after build without copying. But for production thin JAR, MUST copy dist/* to src/main/resources/static/ so it's inside JAR classpath. Therefore copy step is required anyway.
  - Maven-resources-plugin or copy via ant-run plugin simple `<copy todir="src/main/resources/static"><fileset dir="frontend/dist"/></copy>` on every package.
  - Ensure `src/main/resources/static/` directory is .gitignored so generated files don't pollute commits (add pattern `src/main/resources/static/assets/*` and `src/main/resources/static/index.html` to existing .gitignore).
  - Thin JAR vs Fat JAR compatibility: verify both `mvn package` and `mvn package -Pfat` produce working JARs with index.html inside (use `jar tf target/*.jar | grep -E "static/index\.html|BOOT-INF/classes/static/index\.html"`).
- **Acceptance Criteria Addressed**: AC-14 (package produces thin JAR containing index.html + assets), AC-1 (serves index.html)
- **Test Requirements**:
  - `rule` TR-8.1: After `mvn -DskipTests package` run from repo root, file `target/classes/static/index.html` exists AND contains the string `<div id="root"></div>`.
  - `rule` TR-8.2: pom.xml contains exactly one plugin configuration that invokes either (a) npm build directly, or (b) a script that invokes npm build, with phase tied prior to `package` (e.g., prepare-package / process-classes / generate-resources).
  - `rubric` TR-8.3: Build reproducibility. Scale 1-5; 1=requires several manual steps after git clone, 3=requires manual npm install first, 5=one command `mvn package` auto installs frontend deps if missing, runs build, copies output → no steps needed; threshold>=4; evidence=successful fresh clone-style build (delete node_modules + target + src/main/resources/static, then mvn package, still works).
- **Notes**: Order of plugins in pom matters — frontend build must run before JAR packaging. Ensure idempotent re-runs don't double copy / change timestamps unnecessarily.

## Task 9: Verify smoke tests (backend tests + dev server proxy + runtime end-to-end flows per ACs)
- **Status**: `pending`
- **Priority**: high
- **Depends On**: Task 1, 8 (app build), plus Tasks 4-7 page components
- **Description**:
  - (9a) Run `mvn clean test` — capture output, verify exactly "Tests run: 24, Failures: 0, Errors: 0, Skipped: 0".
  - (9b) Start Spring Boot `mvn spring-boot:run` on port 8080. Start Vite dev `cd frontend ; npm run dev` on 5173.
    - Smoke: `curl -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' http://localhost:8080/api/products` → 200 + Allow-Origin header present.
    - Smoke: `Invoke-WebRequest http://localhost:5173/api/products -UseBasicParsing` → content length > 400KB (422 products list JSON).
    - Smoke: `Invoke-WebRequest http://localhost:5173/extracted_images/img_A12.png` → ContentType image/png.
  - (9c) Build production (Task 8 package run), run `java -jar target/...jar` OR `mvn spring-boot:run` (which uses target/classes already):
    - Smoke: `curl http://localhost:8080/products/26/edit` contains `id="root"` (deep link served via SPA forward controller) → verifies AC-2.
    - Smoke: `curl -I http://localhost:8080/assets/index-*.js` → 200 → verifies AC-1 asset serving.
  - (9d) Manual Product create/edit end-to-end using browser integrated MCP tool (or REST equivalent automation) — see AC-5 for specific psql assertions.
- **Acceptance Criteria Addressed**: AC-13 (24 tests), AC-1 (production index.html), AC-2 (deep links), AC-12 (proxy/cors)
- **Test Requirements**:
  - `rule` TR-9.1: 24/24 mvn tests green; exact match of string counts line.
  - `rule` TR-9.2: Deep-link `/products/26/edit` returns 200 HTML with root div; not 404/Thymeleaf.
  - `rule` TR-9.3: Vite proxy `/api/products` returns 200 JSON length > 400,000 bytes.
- **Notes**: This task may also be delegated to a reviewer subagent in the Review phase; however here we run self-verification before handing off.

## Task 10: Minor cleanup & documentation
- **Status**: `pending`
- **Priority**: low
- **Depends On**: All prior tasks
- **Description**:
  - (10a) Update `application.properties` static pattern and Spring Boot static-locations comment blocks explaining serving of React assets.
  - (10b) Add a brief README-style top-of-file comment in `frontend/package.json` or new `frontend/README.md` saying how to run dev (split terminals) or build (Maven). Per project memory we are NOT creating documentation files unless requested, so skip writing doc file; instead just include a "scripts" comment line near scripts object that explains "npm run dev launches Vite on 5173 with proxy to backend 8080; npm run build produces dist for classpath static".
  - (10c) If any warnings in browser console of React dev server: address them (key prop warnings, useEffect missing dependency array warnings common in list pages).
- **Acceptance Criteria Addressed**: General QA / housekeeping only
- **Test Requirements**:
  - `rule` TR-10.1: `npm run build` in frontend/ exits 0 with zero ERR lines (warnings acceptable).
  - `rule` TR-10.2: Browser console on initial page load of /products has 0 React key warnings AND 0 useEffect warnings (capture MCP console_messages output).
- **Notes**: Low priority; implementer should do cleanup as they go but this task formalizes final pass.
