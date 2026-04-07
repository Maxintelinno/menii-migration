-- =========================================================
-- 4) DOCUMENTS
-- =========================================================

CREATE TABLE documents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_user_id UUID NOT NULL,
    related_type VARCHAR(50) NOT NULL,
    related_id UUID,
    file_name VARCHAR(255) NOT NULL,
    file_key TEXT NOT NULL UNIQUE,
    mime_type VARCHAR(150),
    file_size BIGINT NOT NULL DEFAULT 0,
    visibility VARCHAR(50) NOT NULL DEFAULT 'PRIVATE',
    uploaded_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_documents_owner_user
        FOREIGN KEY (owner_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_documents_related_type
        CHECK (related_type IN (
            'LAWYER_LICENSE', 'LAWYER_ID_CARD', 'APPOINTMENT',
            'CHAT_MESSAGE', 'INTAKE_FORM', 'REVIEW_EVIDENCE', 'IDENTITY_VERIFICATION'
        )),
    CONSTRAINT chk_documents_visibility
        CHECK (visibility IN ('PRIVATE', 'CLIENT_AND_LAWYER', 'ADMIN_ONLY'))
);

ALTER TABLE identity_verifications
    ADD CONSTRAINT fk_identity_verifications_document_file
    FOREIGN KEY (document_file_id) REFERENCES documents(id) ON DELETE SET NULL;

ALTER TABLE identity_verifications
    ADD CONSTRAINT fk_identity_verifications_selfie_file
    FOREIGN KEY (selfie_file_id) REFERENCES documents(id) ON DELETE SET NULL;

ALTER TABLE lawyer_licenses
    ADD CONSTRAINT fk_lawyer_licenses_document_file
    FOREIGN KEY (document_file_id) REFERENCES documents(id) ON DELETE SET NULL;

related_type

    - LAWYER_LICENSE
    - LAWYER_ID_CARD
    - APPOINTMENT
    - CHAT_MESSAGE
    - INTAKE_FORM
    - REVIEW_EVIDENCE

visibility
    - PRIVATE
    - CLIENT_AND_LAWYER
    - ADMIN_ONLY