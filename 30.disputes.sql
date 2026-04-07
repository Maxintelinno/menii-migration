CREATE TABLE disputes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL,
    raised_by_user_id UUID NOT NULL,
    dispute_type VARCHAR(100) NOT NULL,
    detail TEXT NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'OPEN',
    assigned_to UUID,
    resolved_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_disputes_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE,
    CONSTRAINT fk_disputes_raised_by
        FOREIGN KEY (raised_by_user_id) REFERENCES users(id) ON DELETE RESTRICT,
    CONSTRAINT fk_disputes_assigned_to
        FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT chk_disputes_status
        CHECK (status IN ('OPEN', 'IN_REVIEW', 'RESOLVED', 'REJECTED'))
);