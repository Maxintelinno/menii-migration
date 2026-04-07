CREATE TABLE identity_verifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    verification_type VARCHAR(50) NOT NULL,
    document_number VARCHAR(100),
    document_file_id UUID,
    selfie_file_id UUID,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    review_note TEXT,
    verified_by UUID,
    verified_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_identity_verifications_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_identity_verifications_verified_by
        FOREIGN KEY (verified_by) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT chk_identity_verifications_status
        CHECK (status IN ('PENDING', 'IN_REVIEW', 'APPROVED', 'REJECTED'))
);