CREATE TABLE lawyer_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE,
    display_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    license_no VARCHAR(100) NOT NULL UNIQUE,
    lawyer_type VARCHAR(100),
    bio TEXT,
    years_experience INT NOT NULL DEFAULT 0,
    office_name VARCHAR(255),
    office_phone VARCHAR(20),
    online_consult_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    onsite_consult_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    home_latitude NUMERIC(10,7),
    home_longitude NUMERIC(10,7),
    base_province_code VARCHAR(10),
    service_radius_km NUMERIC(10,2) DEFAULT 0,
    consultation_fee_chat NUMERIC(12,2) NOT NULL DEFAULT 0,
    consultation_fee_call NUMERIC(12,2) NOT NULL DEFAULT 0,
    consultation_fee_onsite NUMERIC(12,2) NOT NULL DEFAULT 0,
    rating_avg NUMERIC(3,2) NOT NULL DEFAULT 0,
    total_reviews INT NOT NULL DEFAULT 0,
    verification_status VARCHAR(50) NOT NULL DEFAULT 'DRAFT',
    verified_at TIMESTAMPTZ,
    reverify_due_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_profiles_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_lawyer_profiles_province
        FOREIGN KEY (base_province_code) REFERENCES provinces(province_code) ON DELETE SET NULL,
    CONSTRAINT chk_lawyer_profiles_verification_status
        CHECK (verification_status IN (
            'DRAFT', 'SUBMITTED', 'IN_REVIEW', 'NEED_MORE_INFO',
            'APPROVED', 'REJECTED', 'SUSPENDED', 'REVIEW_REQUIRED'
        ))
);