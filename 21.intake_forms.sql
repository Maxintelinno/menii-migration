CREATE TABLE intake_forms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL UNIQUE,
    client_user_id UUID NOT NULL,
    incident_date DATE,
    incident_location TEXT,
    opponent_type VARCHAR(100),
    case_summary TEXT NOT NULL,
    urgency_level VARCHAR(50),
    has_documents BOOLEAN NOT NULL DEFAULT FALSE,
    confidentiality_acknowledged BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_intake_forms_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE,
    CONSTRAINT fk_intake_forms_client
        FOREIGN KEY (client_user_id) REFERENCES users(id) ON DELETE RESTRICT,
    CONSTRAINT chk_intake_forms_urgency_level
        CHECK (urgency_level IN ('LOW', 'MEDIUM', 'HIGH', 'URGENT') OR urgency_level IS NULL)
);

-- ข้อมูลตั้งต้นของปัญหากฎหมาย