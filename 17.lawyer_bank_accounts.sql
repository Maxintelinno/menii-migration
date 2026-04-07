CREATE TABLE lawyer_bank_accounts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    bank_name VARCHAR(150) NOT NULL,
    account_name VARCHAR(255) NOT NULL,
    account_no_masked VARCHAR(50) NOT NULL,
    account_no_encrypted TEXT NOT NULL,
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    verified_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_bank_accounts_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE
);