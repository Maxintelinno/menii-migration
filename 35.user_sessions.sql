CREATE TABLE user_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    refresh_token_hash TEXT NOT NULL,
    device_id VARCHAR(255),
    device_name VARCHAR(255),
    platform VARCHAR(50),
    ip_address INET,
    user_agent TEXT,
    last_used_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expired_at TIMESTAMPTZ NOT NULL,
    revoked_at TIMESTAMPTZ,
    revoke_reason VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_user_sessions_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_otp_requests_phone ON otp_requests(phone);
CREATE INDEX idx_otp_requests_email ON otp_requests(email);
CREATE INDEX idx_otp_requests_reference_code ON otp_requests(reference_code);
CREATE INDEX idx_otp_requests_purpose_status ON otp_requests(purpose, request_status);

CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);
CREATE INDEX idx_user_sessions_expired_at ON user_sessions(expired_at);