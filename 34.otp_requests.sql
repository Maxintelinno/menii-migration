CREATE TABLE otp_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    phone VARCHAR(20),
    email VARCHAR(255),
    otp_code_hash TEXT NOT NULL,
    reference_code VARCHAR(50) NOT NULL UNIQUE,
    purpose VARCHAR(50) NOT NULL,
    target_user_id UUID,
    expired_at TIMESTAMPTZ NOT NULL,
    verified_at TIMESTAMPTZ,
    attempt_count INT NOT NULL DEFAULT 0,
    max_attempt INT NOT NULL DEFAULT 5,
    request_status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_otp_requests_target_user
        FOREIGN KEY (target_user_id) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT chk_otp_requests_purpose
        CHECK (purpose IN ('REGISTER', 'LOGIN', 'FORGOT_PASSWORD', 'RESET_PASSWORD', 'PHONE_VERIFY')),
    CONSTRAINT chk_otp_requests_status
        CHECK (request_status IN ('PENDING', 'VERIFIED', 'EXPIRED', 'FAILED', 'CANCELLED')),
    CONSTRAINT chk_otp_requests_contact
        CHECK (phone IS NOT NULL OR email IS NOT NULL)
);