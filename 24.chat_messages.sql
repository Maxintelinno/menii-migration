CREATE TABLE chat_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    room_id UUID NOT NULL,
    sender_user_id UUID NOT NULL,
    message_type VARCHAR(50) NOT NULL DEFAULT 'TEXT',
    message_text TEXT,
    attachment_file_id UUID,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    sent_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_chat_messages_room
        FOREIGN KEY (room_id) REFERENCES chat_rooms(id) ON DELETE CASCADE,
    CONSTRAINT fk_chat_messages_sender
        FOREIGN KEY (sender_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_chat_messages_attachment
        FOREIGN KEY (attachment_file_id) REFERENCES documents(id) ON DELETE SET NULL,
    CONSTRAINT chk_chat_messages_type
        CHECK (message_type IN ('TEXT', 'IMAGE', 'FILE', 'SYSTEM'))
);

message_type
    - TEXT
    - IMAGE
    - FILE
    - SYSTEM