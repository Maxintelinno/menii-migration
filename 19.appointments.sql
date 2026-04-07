-- =========================================================
-- 5) APPOINTMENTS & INTAKE
-- =========================================================

CREATE TABLE appointments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_no VARCHAR(50) NOT NULL UNIQUE,
    client_user_id UUID NOT NULL,
    lawyer_profile_id UUID NOT NULL,
    practice_area_id UUID NOT NULL,
    consult_type VARCHAR(50) NOT NULL,
    meeting_type VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    problem_summary TEXT,
    preferred_date DATE,
    scheduled_start_at TIMESTAMPTZ,
    scheduled_end_at TIMESTAMPTZ,
    province_code VARCHAR(10),
    district_code VARCHAR(20),
    meeting_address TEXT,
    online_meeting_url TEXT,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING_PAYMENT',
    cancellation_reason TEXT,
    cancelled_by UUID,
    cancelled_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_appointments_client
        FOREIGN KEY (client_user_id) REFERENCES users(id) ON DELETE RESTRICT,
    CONSTRAINT fk_appointments_lawyer
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT fk_appointments_area
        FOREIGN KEY (practice_area_id) REFERENCES practice_areas(id) ON DELETE RESTRICT,
    CONSTRAINT fk_appointments_province
        FOREIGN KEY (province_code) REFERENCES provinces(province_code) ON DELETE SET NULL,
    CONSTRAINT fk_appointments_district
        FOREIGN KEY (district_code) REFERENCES districts(district_code) ON DELETE SET NULL,
    CONSTRAINT fk_appointments_cancelled_by
        FOREIGN KEY (cancelled_by) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT chk_appointments_consult_type
        CHECK (consult_type IN ('CHAT', 'CALL', 'ONSITE')),
    CONSTRAINT chk_appointments_meeting_type
        CHECK (meeting_type IN ('ONLINE', 'ONSITE')),
    CONSTRAINT chk_appointments_status
        CHECK (status IN (
            'PENDING_PAYMENT', 'PAYMENT_FAILED', 'LAWYER_PENDING',
            'CONFIRMED', 'LAWYER_DECLINED', 'CLIENT_CANCELLED',
            'LAWYER_CANCELLED', 'COMPLETED', 'NO_SHOW',
            'DISPUTED', 'REFUNDED'
        )),
    CONSTRAINT chk_appointments_time
        CHECK (
            scheduled_end_at IS NULL
            OR scheduled_start_at IS NULL
            OR scheduled_end_at > scheduled_start_at
        )
);

-- หัวใจของระบบ booking
ค่าแนะนำ:
consult_type
    - CHAT
    - CALL
    - ONSITE

meeting_type
    - ONLINE
    - ONSITE

status
    - PENDING_PAYMENT
    - CONFIRMED
    - LAWYER_ACCEPTED
    - LAWYER_DECLINED
    - CLIENT_CANCELLED
    - LAWYER_CANCELLED
    - COMPLETED
    - NO_SHOW
    - DISPUTED
    - REFUNDED