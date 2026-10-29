SET client_encoding = 'UTF8';

-- =============================================================================
-- Windwah Inventory - Application user table (admin login + role based access)
-- Matches com.egate.inventory.entity.AppUser exactly.
-- =============================================================================

CREATE TABLE IF NOT EXISTS app_user (
    id             BIGSERIAL PRIMARY KEY,
    username       VARCHAR(64)  NOT NULL,
    password_hash  VARCHAR(100) NOT NULL,
    display_name   VARCHAR(128),
    role           VARCHAR(32)  NOT NULL DEFAULT 'ROLE_VIEWER',
    enabled        BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at     TIMESTAMP(6) WITH TIME ZONE,
    updated_at     TIMESTAMP(6) WITH TIME ZONE,
    CONSTRAINT uq_app_user_username UNIQUE (username),
    CONSTRAINT ck_app_user_role CHECK (role IN ('ROLE_ADMIN', 'ROLE_EDITOR', 'ROLE_VIEWER'))
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_app_user_username ON app_user (username);

COMMENT ON TABLE  app_user               IS 'Application login accounts for the inventory SPA.';
COMMENT ON COLUMN app_user.password_hash IS 'BCrypt hash - never store the plain text password.';
COMMENT ON COLUMN app_user.role          IS 'Access level: ROLE_ADMIN | ROLE_EDITOR | ROLE_VIEWER.';

-- -----------------------------------------------------------------------------
-- Seeding the first administrator
-- -----------------------------------------------------------------------------
-- Option A (recommended): let the application create it on startup by setting
--   app.security.bootstrap.enabled=true
--   app.security.bootstrap.username=admin
--   app.security.bootstrap.password=<strong-password>   (prefer an env var)
--
-- Option B: insert a row yourself. Generate the BCrypt hash first, then run:
--   INSERT INTO app_user (username, password_hash, display_name, role, enabled)
--   VALUES ('admin', '$2a$10$<bcrypt-hash>', 'E-Gate Administrator', 'ROLE_ADMIN', TRUE)
--   ON CONFLICT (username) DO NOTHING;
