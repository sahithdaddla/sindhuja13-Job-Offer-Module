CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    referral_id VARCHAR(10) UNIQUE NOT NULL, -- New column for referral ID
    role VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL,
    personal_info JSONB NOT NULL,
    employment_status VARCHAR(20) NOT NULL,
    employment_history JSONB,
    documents JSONB NOT NULL,
    offer_letter JSONB,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_applications_email ON applications USING btree ((personal_info->>'email'));
CREATE INDEX idx_applications_phone ON applications USING btree ((personal_info->>'phone'));
CREATE INDEX idx_applications_status ON applications USING btree (status);
CREATE INDEX idx_applications_created_at ON applications USING btree (created_at);
CREATE INDEX idx_applications_referral_id ON applications USING btree (referral_id); -- Index for referral_id
