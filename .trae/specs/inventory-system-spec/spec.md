# Inventory System (Spring Boot) - Product Requirements Document

## Overview
- **Summary**: A Java 17 Spring Boot inventory management system that supports full product CRUD, exports inventory data to Amazon Seller Central and eBay Seller Hub Excel templates, and optionally submits inventory directly via Amazon SP-API and eBay RESTful APIs.
- **Purpose**: Provide a single source of truth for product inventory and streamline multi-channel listing operations for Amazon and eBay sellers.
- **Target Users**: E-commerce inventory operators, sellers, and operations staff managing listings across Amazon and eBay.

## Goals
- Manage products and inventory levels (CRUD) via web UI and REST API.
- Generate Excel files in Amazon's required inventory template format for manual upload to Seller Central.
- Generate Excel files in eBay's File Exchange inventory template format for manual upload to Seller Hub.
- Provide (stubbed, configurable) direct API submission to Amazon SP-API and eBay REST APIs.
- Persist inventory data in PostgreSQL.
- Expose a browser-based web UI (Thymeleaf) for human operators and a REST API for system integration.

## Non-Goals
- Full order / fulfillment management (beyond inventory level sync).
- Multi-tenant SaaS support; single instance / single seller.
- Real-time inventory synchronization with marketplaces beyond batch export/submit.
- User authentication, authorization, and role-based access control (RBAC) — open access for now.
- Payment processing or financial reconciliation.

## Background & Context
- Project root: `c:\Windwah\EGate_System\Inventory` (empty repository, greenfield).
- User is a senior maintenance developer working on Windows; prefers Spring, explicit configurations, and non-fat JAR deployment compatible with legacy shell scripts using `-cp`.
- Communication: Traditional Chinese preferred for summaries, English for code/log-level output.

## Functional Requirements
- **FR-1 Product CRUD**: Create, read, update, and delete inventory products (SKU, title, description, quantity, price, UPC/EAN, brand, category, images, weight, dimensions, listing status).
- **FR-2 Web UI Pages**: Home dashboard, product list, add/edit product form, export page, API configuration page.
- **FR-3 REST API**: REST endpoints mirroring product CRUD plus export and API-submit actions.
- **FR-4 Amazon Excel Export**: Generate `.xlsx` that matches the Amazon Seller Central inventory file template (standard required columns: SKU, Product Name, Manufacturer, Brand, UPC, EAN, Quantity, Price, Currency, Condition, Description, Category, Image URLs).
- **FR-5 eBay Excel Export**: Generate `.xlsx` that matches the eBay File Exchange Inventory template (Action, SKU, Title, Description, Start Price, Quantity, Condition ID, Brand, MPN, UPC, Primary Category ID, Picture URLs, Item Location, Postal Code, Country, Shipping Profile).
- **FR-6 Export Selection**: Support exporting all products, a filtered subset, or individually selected products to either Amazon or eBay Excel format.
- **FR-7 Amazon SP-API Integration**: Provide a configurable client (access via properties) that submits a feed of selected inventory to the SP-API Feeds API; allow dry-run / stub mode when credentials are absent.
- **FR-8 eBay REST Integration**: Provide a configurable client (access via properties) that creates/revises inventory items via eBay Inventory API; allow dry-run / stub mode when credentials are absent.
- **FR-9 Configuration**: Expose `application.properties` / environment-variable configuration for DB, Amazon SP-API endpoints & credentials, eBay REST endpoints & credentials.
- **FR-10 Error Handling & Validation**: Validate product fields (SKU uniqueness, price > 0, qty >= 0) and return user-readable errors on UI and API. Export/API jobs must report successes and failures.

## Non-Functional Requirements
- **NFR-1 Buildable**: Maven project (`mvnw.cmd` present for Windows) that compiles and packages on Java 17 with zero edits.
- **NFR-2 Executable**: `mvnw.cmd spring-boot:run` starts the application on port 8080 and serves the web UI.
- **NFR-3 Portable Config**: All secrets and URLs are externalized via `application.properties` / env vars — no secrets in source code.
- **NFR-4 Test Coverage**: Unit tests for Excel export logic (Amazon + eBay) run with `mvnw.cmd test` and pass.
- **NFR-5 Package Layout**: Standard Maven project layout (`src/main/java`, `src/main/resources`, `src/test/java`, `src/test/resources`).
- **NFR-6 Dependencies**: Spring Boot Web, Thymeleaf, Data JPA, PostgreSQL Driver, Apache POI (for Excel), Validation, Lombok (optional).

## Constraints
- **Technical**: Java 17 LTS, Spring Boot 3.x, PostgreSQL, Apache POI for Excel generation. API integrations must degrade to stub mode when credentials are not configured.
- **Business**: Amazon and eBay export templates must match the columns officially required by each marketplace's template/File Exchange documentation.
- **Dependencies**: PostgreSQL instance accessible at build/runtime (or allow H2 profile for local demo); Amazon SP-API and eBay developer credentials optional for Excel-only path.

## Assumptions
- Operator will populate `application.properties` / environment variables for DB and any API credentials.
- Amazon SP-API feed submission uses the `POST_INVENTORY_AVAILABILITY_DATA` or equivalent JSON feed; exact feed type can be parameterized.
- eBay submission uses the Inventory Item and Offer endpoints of eBay's Inventory API v1_beta.
- Excel templates include the most commonly required columns; additional columns can be extended via Java code constants.

## Acceptance Criteria

### AC-1: Product list page renders products from DB
- **Type**: `rule`
- **Given**: PostgreSQL is running and the app is started with at least 1 product saved
- **When**: Navigating to `/products` in a browser
- **Then**: The page displays a table with SKU, Title, Quantity, and Price columns for the saved product(s)
- **Pass Condition**: UI renders products; DB row count matches UI row count for seeded data
- **Evidence**: Screenshot or HTML snapshot of `/products` page after seeding; SQL count query output

### AC-2: Product creation persists to DB
- **Type**: `rule`
- **Given**: The add-product form at `/products/new`
- **When**: Submitting a valid product (SKU=`TEST-001`, Title=`Test Item`, Price=`9.99`, Quantity=`10`)
- **Then**: The product is saved to the `product` table and visible in the product list
- **Pass Condition**: SQL `SELECT COUNT(*) FROM product WHERE sku='TEST-001'` returns 1
- **Evidence**: SQL query output + redirect-to-list screenshot

### AC-3: Amazon Excel export contains required columns and data rows
- **Type**: `rule`
- **Given**: At least 2 products exist in the DB
- **When**: Calling `/export/amazon` (UI button or REST GET) with default selection
- **Then**: A `.xlsx` file is downloaded whose first sheet contains, in order, the columns: SKU, Product Name, Manufacturer, Brand, UPC, EAN, Quantity, Price, Currency, Condition, Description, Category, Image URLs; and 2 data rows matching the DB products
- **Pass Condition**: Apache POI-based unit test reads the generated workbook and asserts column headers and row count; manual spot-check on the downloaded file
- **Evidence**: Unit test output (`mvn test` for Amazon export test); exported Excel opened to first sheet

### AC-4: eBay Excel export contains required columns and data rows
- **Type**: `rule`
- **Given**: At least 2 products exist in the DB
- **When**: Calling `/export/ebay` (UI button or REST GET) with default selection
- **Then**: A `.xlsx` file is downloaded whose first sheet contains, in order, the columns: Action, SKU, Title, Description, Start Price, Quantity, Condition ID, Brand, MPN, UPC, Primary Category ID, Picture URLs, Item Location, Postal Code, Country, Shipping Profile; and 2 data rows matching the DB products
- **Pass Condition**: Apache POI-based unit test reads the generated workbook and asserts column headers and row count
- **Evidence**: Unit test output (`mvn test` for eBay export test); exported Excel opened to first sheet

### AC-5: REST CRUD endpoints respond with JSON
- **Type**: `rule`
- **Given**: Running application
- **When**: `GET /api/products`, `POST /api/products {valid body}`, `PUT /api/products/{id}`, `DELETE /api/products/{id}`
- **Then**: All return JSON with 2xx status; POST/PUT/DELETE changes are reflected in DB and in subsequent GET
- **Pass Condition**: curl/httpie output showing status codes and JSON bodies for each call
- **Evidence**: HTTP request/response logs for each of the four verbs

### AC-6: Amazon SP-API client runs in stub mode by default
- **Type**: `rule`
- **Given**: Default `application.properties` with no SP-API credentials set
- **When**: Triggering `/api/submit/amazon` for a product list
- **Then**: The endpoint returns HTTP 200 and a JSON body reporting `mode=STUB` plus the list of SKUs that *would* be submitted, without calling any external host
- **Pass Condition**: No outbound HTTP; response body includes `mode=STUB` and the submitted SKU list
- **Evidence**: HTTP response body + application log confirming stub path taken

### AC-7: eBay REST client runs in stub mode by default
- **Type**: `rule`
- **Given**: Default `application.properties` with no eBay credentials set
- **When**: Triggering `/api/submit/ebay` for a product list
- **Then**: The endpoint returns HTTP 200 and a JSON body reporting `mode=STUB` plus the list of SKUs that *would* be submitted, without calling any external host
- **Pass Condition**: No outbound HTTP; response body includes `mode=STUB` and the submitted SKU list
- **Evidence**: HTTP response body + application log confirming stub path taken

### AC-8: Validation rejects invalid products
- **Type**: `rule`
- **Given**: The add-product form or `POST /api/products`
- **When**: Submitting a product with blank SKU, negative price, or negative quantity
- **Then**: Creation is rejected with a clear error message (UI form shows error next to field; API returns 400 JSON with field errors) and the DB remains unchanged
- **Pass Condition**: Error messages present; DB unchanged
- **Evidence**: Screenshot of form errors + 400 JSON response body; SQL count confirming no new row

### AC-9: Project compiles and tests pass
- **Type**: `rule`
- **Given**: Clean clone of the repository and Java 17 on PATH
- **When**: Running `mvnw.cmd clean test`
- **Then**: Build reports `BUILD SUCCESS` and all tests pass
- **Pass Condition**: Exit code 0 from Maven; JUnit summary showing all tests passed
- **Evidence**: Full Maven test log output

### AC-10: Package layout and dependency quality
- **Type**: `rubric`
- **Dimension**: Cohesion, separation of concerns, and dependency choice appropriateness
- **Scale**: 1-5
- **Anchors**: 1 = monolithic single package, missing layers; 3 = reasonable controller/service/repository/entity split, correct deps but some mixing; 5 = clean packages (entity, repository, service, controller, export, integration, config), all deps required, no unused imports or accidental fat-JAR coupling
- **Pass Threshold**: >= 4
- **Evidence**: `tree /F` of `src/main/java` + pom.xml dependency listing

## Open Questions
- [ ] Exact Amazon feed type / feed content version for SP-API submission (default: inventory availability feed JSON)?
- [ ] Additional product fields to carry (e.g., variation / parent SKU, FNSKU, MSRP, bullet points)?
- [ ] Deployment target: standalone fat JAR or thin (non-fat) JAR with `-cp` script? Default: build both via Maven profiles; default packaging thin-non-fat per user preference.
