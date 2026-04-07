CREATE TABLE revenue_ledgers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    payment_id UUID NOT NULL,
    appointment_id UUID NOT NULL,
    lawyer_profile_id UUID NOT NULL,
    entry_type VARCHAR(50) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    direction VARCHAR(10) NOT NULL,
    note TEXT,
    payout_id UUID,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_revenue_ledgers_payment
        FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE,
    CONSTRAINT fk_revenue_ledgers_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE RESTRICT,
    CONSTRAINT fk_revenue_ledgers_lawyer
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT fk_revenue_ledgers_payout
        FOREIGN KEY (payout_id) REFERENCES payouts(id) ON DELETE SET NULL,
    CONSTRAINT chk_revenue_ledgers_entry_type
        CHECK (entry_type IN (
            'GROSS', 'PLATFORM_FEE', 'GATEWAY_FEE',
            'LAWYER_NET', 'REFUND', 'MANUAL_ADJUSTMENT'
        )),
    CONSTRAINT chk_revenue_ledgers_direction
        CHECK (direction IN ('CREDIT', 'DEBIT'))
);

--ตารางนี้สำคัญมาก อย่าข้าม
entry_type
    - GROSS
    - PLATFORM_FEE
    - GATEWAY_FEE
    - LAWYER_NET
    - REFUND
    - MANUAL_ADJUSTMENT

direction
    - CREDIT
    - DEBIT