-- =========================================================
-- LEGAL MARKETPLACE - PHASE 1 DATABASE SCHEMA
-- PostgreSQL
-- =========================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- =========================================================
-- 1) MASTER TABLES
-- =========================================================

CREATE TABLE roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(50) NOT NULL UNIQUE, --ตัวอย่าง: CLIENT, LAWYER, VERIFIER, FINANCE, SUPER_ADMIN
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
 