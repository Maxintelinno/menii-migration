-- =========================================================
-- 3) LAWYER DOMAIN TABLES เก็บประวัติเอกสารวิชาชีพ
-- =========================================================

CREATE TABLE lawyer_licenses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    license_no VARCHAR(100) NOT NULL,
    license_type VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    issuing_authority VARCHAR(255),
    document_file_id UUID,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_licenses_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE
);