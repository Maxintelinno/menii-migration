CREATE TABLE lawyer_availabilities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    day_of_week INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    timezone VARCHAR(100) NOT NULL DEFAULT 'Asia/Bangkok',
    slot_duration_min INT NOT NULL DEFAULT 30,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_availabilities_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE,
    CONSTRAINT chk_lawyer_availabilities_day CHECK (day_of_week BETWEEN 0 AND 6),
    CONSTRAINT chk_lawyer_availabilities_time CHECK (end_time > start_time)
);
--ตารางว่างของทนาย