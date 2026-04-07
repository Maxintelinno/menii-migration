CREATE TABLE payment_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    payment_id UUID NOT NULL,
    txn_type VARCHAR(50) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    reference_no VARCHAR(255),
    raw_payload JSONB,
    status VARCHAR(50),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_payment_transactions_payment
        FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE,
    CONSTRAINT chk_payment_transactions_type
        CHECK (txn_type IN ('PAYMENT', 'WEBHOOK', 'REFUND', 'ADJUSTMENT'))
);