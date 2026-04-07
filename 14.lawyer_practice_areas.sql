CREATE TABLE lawyer_practice_areas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    practice_area_id UUID NOT NULL,
    years_experience INT NOT NULL DEFAULT 0,
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_practice_areas_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE,
    CONSTRAINT fk_lawyer_practice_areas_area
        FOREIGN KEY (practice_area_id) REFERENCES practice_areas(id) ON DELETE RESTRICT,
    CONSTRAINT uq_lawyer_practice_area UNIQUE (lawyer_profile_id, practice_area_id)
);