-- =========================================================
-- 8) REVIEW / DISPUTE / CONSENT / AUDIT
-- =========================================================

CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL UNIQUE,
    client_user_id UUID NOT NULL,
    lawyer_profile_id UUID NOT NULL,
    rating INT NOT NULL,
    comment TEXT,
    status VARCHAR(50) NOT NULL DEFAULT 'PUBLISHED',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_reviews_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_client
        FOREIGN KEY (client_user_id) REFERENCES users(id) ON DELETE RESTRICT,
    CONSTRAINT fk_reviews_lawyer
        FOREIGN KEY (lawyer_profile_id) REFERENCES lawyer_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT chk_reviews_rating CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT chk_reviews_status CHECK (status IN ('PUBLISHED', 'HIDDEN', 'UNDER_REVIEW'))
);

status
    - PUBLISHED
    - HIDDEN
    - UNDER_REVIEW