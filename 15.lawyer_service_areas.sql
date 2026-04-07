CREATE TABLE lawyer_service_areas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lawyer_profile_id UUID NOT NULL,
    province_code VARCHAR(10),
    district_code VARCHAR(20),
    area_type VARCHAR(50) NOT NULL DEFAULT 'DISTRICT',
    onsite_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    online_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_lawyer_service_areas_profile
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE CASCADE,
    CONSTRAINT fk_lawyer_service_areas_province
        FOREIGN KEY (province_code) REFERENCES provinces(province_code) ON DELETE SET NULL,
    CONSTRAINT fk_lawyer_service_areas_district
        FOREIGN KEY (district_code) REFERENCES districts(district_code) ON DELETE SET NULL,
    CONSTRAINT chk_lawyer_service_areas_area_type
        CHECK (area_type IN ('PROVINCE', 'DISTRICT', 'NATIONWIDE'))
);