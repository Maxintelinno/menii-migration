
-- workflow ตรวจสอบ
CREATE TABLE lawyer_verifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    submitted_at TIMESTAMPTZ,
    review_status VARCHAR(50) NOT NULL DEFAULT 'DRAFT',
    review_note TEXT,
    reviewed_by UUID,
    reviewed_at TIMESTAMPTZ,
    reverify_due_at TIMESTAMPTZ,
    source_type VARCHAR(100),
    source_reference VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_verifications_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE,
    CONSTRAINT fk_lawyer_verifications_reviewer
        FOREIGN KEY (reviewed_by) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT chk_lawyer_verifications_status
        CHECK (review_status IN (
            'DRAFT', 'SUBMITTED', 'IN_REVIEW',
            'NEED_MORE_INFO', 'APPROVED', 'REJECTED', 'SUSPENDED'
        ))
);


-- review_status: DRAFT, SUBMITTED, IN_REVIEW, NEED_MORE_INFO, APPROVED, REJECTED, SUSPENDED