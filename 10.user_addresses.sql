CREATE TABLE user_addresses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    subdistrict VARCHAR(150),
    district_code VARCHAR(20),
    province_code VARCHAR(10),
    postal_code VARCHAR(20),
    latitude NUMERIC(10,7),
    longitude NUMERIC(10,7),
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_user_addresses_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_addresses_district
        FOREIGN KEY (district_code) REFERENCES districts(district_code) ON DELETE SET NULL,
    CONSTRAINT fk_user_addresses_province
        FOREIGN KEY (province_code) REFERENCES provinces(province_code) ON DELETE SET NULL
);