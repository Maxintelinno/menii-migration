CREATE TABLE payouts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    payout_no VARCHAR(50) NOT NULL UNIQUE,
    total_amount NUMERIC(12,2) NOT NULL,
    payout_status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    payout_date TIMESTAMPTZ,
    bank_account_id UUID,
    reference_no VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_payouts_lawyer
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT fk_payouts_bank_account
        FOREIGN KEY (bank_account_id) REFERENCES lawyer_bank_accounts(id) ON DELETE SET NULL,
    CONSTRAINT chk_payouts_status
        CHECK (payout_status IN ('PENDING', 'GENERATED', 'PROCESSING', 'PAID', 'FAILED'))
);