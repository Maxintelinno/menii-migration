CREATE TABLE provinces (
    province_code VARCHAR(10) PRIMARY KEY,
    province_name_th VARCHAR(150) NOT NULL,
    province_name_en VARCHAR(150),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);