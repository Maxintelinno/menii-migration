CREATE TABLE districts (
    district_code VARCHAR(20) PRIMARY KEY,
    province_code VARCHAR(10) NOT NULL,
    district_name_th VARCHAR(150) NOT NULL,
    district_name_en VARCHAR(150),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_districts_province
        FOREIGN KEY (province_code) REFERENCES provinces(province_code)
        ON DELETE RESTRICT
);
