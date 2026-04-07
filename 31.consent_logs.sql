CREATE TABLE consent_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    consent_type VARCHAR(100) NOT NULL,
    consent_version VARCHAR(50) NOT NULL,
    accepted BOOLEAN NOT NULL,
    accepted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    source VARCHAR(50),
    CONSTRAINT fk_consent_logs_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- การทำ consent, access control, audit log, การจำกัดสิทธิ์เข้าถึงเอกสาร และการกำหนด retention policy เป็นแนวทางที่เหมาะมากกับระบบนี้ เพราะ PDPC เป็นหน่วยงานกำกับเรื่องข้อมูลส่วนบุคคลโดยตรง และระบบนี้มีความเสี่ยงสูงด้านข้อมูลอ่อนไหว