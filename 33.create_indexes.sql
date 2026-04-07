-- =========================================================
-- 9) INDEXES
-- =========================================================

CREATE INDEX idx_users_phone ON users(phone);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_status ON users(status);

CREATE INDEX idx_client_profiles_user_id ON client_profiles(user_id);

CREATE INDEX idx_lawyer_profiles_user_id ON lawyer_profiles(user_id);
CREATE INDEX idx_lawyer_profiles_license_no ON lawyer_profiles(license_no);
CREATE INDEX idx_lawyer_profiles_verification_status ON lawyer_profiles(verification_status);
CREATE INDEX idx_lawyer_profiles_base_province ON lawyer_profiles(base_province_code);
CREATE INDEX idx_lawyer_profiles_rating_avg ON lawyer_profiles(rating_avg);

CREATE INDEX idx_lawyer_verifications_profile_id ON lawyer_verifications(lawyer_profile_id);
CREATE INDEX idx_lawyer_verifications_status ON lawyer_verifications(review_status);
CREATE INDEX idx_lawyer_verifications_reviewed_by ON lawyer_verifications(reviewed_by);

CREATE INDEX idx_lawyer_practice_areas_profile_id ON lawyer_practice_areas(lawyer_profile_id);
CREATE INDEX idx_lawyer_practice_areas_area_id ON lawyer_practice_areas(practice_area_id);

CREATE INDEX idx_lawyer_service_areas_profile_id ON lawyer_service_areas(lawyer_profile_id);
CREATE INDEX idx_lawyer_service_areas_province_code ON lawyer_service_areas(province_code);
CREATE INDEX idx_lawyer_service_areas_district_code ON lawyer_service_areas(district_code);

CREATE INDEX idx_lawyer_availabilities_profile_id ON lawyer_availabilities(lawyer_profile_id);
CREATE INDEX idx_lawyer_availabilities_day_of_week ON lawyer_availabilities(day_of_week);

CREATE INDEX idx_documents_owner_user_id ON documents(owner_user_id);
CREATE INDEX idx_documents_related ON documents(related_type, related_id);

CREATE INDEX idx_appointments_client_user_id ON appointments(client_user_id);
CREATE INDEX idx_appointments_lawyer_profile_id ON appointments(lawyer_profile_id);
CREATE INDEX idx_appointments_practice_area_id ON appointments(practice_area_id);
CREATE INDEX idx_appointments_status ON appointments(status);
CREATE INDEX idx_appointments_scheduled_start_at ON appointments(scheduled_start_at);
CREATE INDEX idx_appointments_province_code ON appointments(province_code);
CREATE INDEX idx_appointments_district_code ON appointments(district_code);

CREATE INDEX idx_appointment_status_logs_appointment_id ON appointment_status_logs(appointment_id);

CREATE INDEX idx_chat_rooms_appointment_id ON chat_rooms(appointment_id);
CREATE INDEX idx_chat_participants_room_id ON chat_participants(room_id);
CREATE INDEX idx_chat_participants_user_id ON chat_participants(user_id);
CREATE INDEX idx_chat_messages_room_id ON chat_messages(room_id);
CREATE INDEX idx_chat_messages_sender_user_id ON chat_messages(sender_user_id);
CREATE INDEX idx_chat_messages_sent_at ON chat_messages(sent_at);

CREATE INDEX idx_payments_appointment_id ON payments(appointment_id);
CREATE INDEX idx_payments_payer_user_id ON payments(payer_user_id);
CREATE INDEX idx_payments_lawyer_profile_id ON payments(lawyer_profile_id);
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_gateway_txn_id ON payments(gateway_txn_id);

CREATE INDEX idx_payment_transactions_payment_id ON payment_transactions(payment_id);

CREATE INDEX idx_revenue_ledgers_payment_id ON revenue_ledgers(payment_id);
CREATE INDEX idx_revenue_ledgers_appointment_id ON revenue_ledgers(appointment_id);
CREATE INDEX idx_revenue_ledgers_lawyer_profile_id ON revenue_ledgers(lawyer_profile_id);
CREATE INDEX idx_revenue_ledgers_payout_id ON revenue_ledgers(payout_id);
CREATE INDEX idx_revenue_ledgers_entry_type ON revenue_ledgers(entry_type);

CREATE INDEX idx_payouts_lawyer_profile_id ON payouts(lawyer_profile_id);
CREATE INDEX idx_payouts_status ON payouts(payout_status);

CREATE INDEX idx_reviews_lawyer_profile_id ON reviews(lawyer_profile_id);
CREATE INDEX idx_reviews_status ON reviews(status);

CREATE INDEX idx_disputes_appointment_id ON disputes(appointment_id);
CREATE INDEX idx_disputes_status ON disputes(status);
CREATE INDEX idx_disputes_assigned_to ON disputes(assigned_to);

CREATE INDEX idx_consent_logs_user_id ON consent_logs(user_id);
CREATE INDEX idx_consent_logs_consent_type ON consent_logs(consent_type);

CREATE INDEX idx_audit_logs_actor_user_id ON audit_logs(actor_user_id);
CREATE INDEX idx_audit_logs_entity ON audit_logs(entity_type, entity_id);
CREATE INDEX idx_audit_logs_created_at ON audit_logs(created_at);