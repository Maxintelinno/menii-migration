-- =========================================================
-- 7) PAYMENTS / LEDGER / PAYOUT
-- =========================================================

CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    payment_no VARCHAR(50) NOT NULL UNIQUE,
    appointment_id UUID NOT NULL UNIQUE,
    payer_user_id UUID NOT NULL,
    lawyer_profile_id UUID NOT NULL,
    amount_gross NUMERIC(12,2) NOT NULL,
    currency VARCHAR(10) NOT NULL DEFAULT 'THB',
    gateway_provider VARCHAR(100),
    gateway_txn_id VARCHAR(255),
    payment_method VARCHAR(50),
    status VARCHAR(50) NOT NULL DEFAULT 'INITIATED',
    paid_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_payments_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE RESTRICT,
    CONSTRAINT fk_payments_payer
        FOREIGN KEY (payer_user_id) REFERENCES users(id) ON DELETE RESTRICT,
    CONSTRAINT fk_payments_lawyer
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT chk_payments_status
        CHECK (status IN (
            'INITIATED', 'PENDING', 'PAID', 'FAILED',
            'CANCELLED', 'REFUNDED', 'PARTIALLY_REFUNDED'
        ))
);

status
    - INITIATED
    - PENDING
    - PAID
    - FAILED
    - CANCELLED
    - REFUNDED
    - PARTIALLY_REFUNDED