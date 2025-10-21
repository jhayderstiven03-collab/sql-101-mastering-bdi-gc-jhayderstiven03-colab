CREATE TABLE "PATIENT" (
  "patient_id" integer PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "middle_name" varchar,
  "last_name" varchar NOT NULL,
  "matern_name" varchar,
  "date_of_birth" date NOT NULL,
  "sex" varchar NOT NULL,
  "email" varchar,
  "registration_date" timestamp NOT NULL,
  "active" boolean NOT NULL
);

CREATE TABLE "PATIENT_DOCUMENT" (
  "document_id" integer PRIMARY KEY,
  "document_type" varchar NOT NULL,
  "document_number" varchar NOT NULL,
  "issuing_country" varchar NOT NULL,
  "issue_date" date,
  "patient_id" integer NOT NULL
);

CREATE TABLE "PATIENT_ADDRESS" (
  "address_id" integer PRIMARY KEY,
  "address_type" varchar NOT NULL,
  "department" varchar NOT NULL,
  "city" varchar NOT NULL,
  "postal_code" varchar,
  "address_text" text NOT NULL,
  "patient_id" integer NOT NULL
);

CREATE TABLE "PATIENT_PHONE" (
  "phone_id" integer PRIMARY KEY,
  "phone_type" varchar NOT NULL,
  "phone_number" varchar NOT NULL,
  "is_primary" boolean NOT NULL,
  "patient_id" integer NOT NULL
);

CREATE TABLE "PATIENT_POLICY" (
  "policy_id" integer PRIMARY KEY,
  "policy_number" varchar NOT NULL,
  "insurer_name" varchar NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date,
  "coverage_type" varchar,
  "patient_id" integer NOT NULL
);

CREATE TABLE "PATIENT_EMERGENCY_CONTACT" (
  "emergency_contact_id" integer PRIMARY KEY,
  "contact_name" varchar NOT NULL,
  "relationship" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "email" varchar,
  "instructions" text,
  "patient_id" integer NOT NULL
);

CREATE TABLE "PROFESSIONAL" (
  "professional_id" integer PRIMARY KEY,
  "internal_code" varchar NOT NULL,
  "license_number" varchar UNIQUE NOT NULL,
  "first_names" varchar NOT NULL,
  "last_names" varchar NOT NULL,
  "email_professional" varchar NOT NULL,
  "hospital_entry_date" date NOT NULL,
  "active" boolean NOT NULL
);

CREATE TABLE "PROFESSIONAL_SPECIALTY" (
  "professional_specialty_id" integer PRIMARY KEY,
  "specialty_name" varchar NOT NULL,
  "certification_number" varchar,
  "certification_date" date,
  "professional_id" integer NOT NULL
);

CREATE TABLE "PROFESSIONAL_SCHEDULE" (
  "schedule_id" integer PRIMARY KEY,
  "day_of_week" varchar NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "modality" varchar,
  "location" varchar,
  "professional_id" integer NOT NULL
);

CREATE TABLE "APPOINTMENT" (
  "appointment_id" integer PRIMARY KEY,
  "appointment_date" date NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "appointment_type" varchar NOT NULL,
  "status" varchar NOT NULL,
  "reason" text,
  "created_by" varchar NOT NULL,
  "creation_date" timestamp NOT NULL,
  "patient_id" integer NOT NULL,
  "professional_id" integer NOT NULL
);

CREATE TABLE "APPOINTMENT_ROOM" (
  "appointment_room_id" integer PRIMARY KEY,
  "room_number" varchar NOT NULL,
  "room_type" varchar,
  "building" varchar,
  "floor_number" integer,
  "appointment_id" integer NOT NULL
);

CREATE TABLE "MEDICAL_RECORD" (
  "record_id" integer PRIMARY KEY,
  "record_datetime" timestamp NOT NULL,
  "record_type" varchar NOT NULL,
  "summary_text" text,
  "clinical_notes" text,
  "appointment_id" integer NOT NULL,
  "patient_id" integer NOT NULL,
  "professional_id" integer NOT NULL
);

CREATE TABLE "RECORD_DIAGNOSIS" (
  "record_diagnosis_id" integer PRIMARY KEY,
  "diagnosis_code" varchar NOT NULL,
  "diagnosis_description" varchar NOT NULL,
  "diagnosis_type" varchar NOT NULL,
  "severity_level" integer,
  "record_id" integer NOT NULL
);

CREATE TABLE "RECORD_VITAL_SIGN" (
  "vital_sign_id" integer PRIMARY KEY,
  "vital_type" varchar NOT NULL,
  "vital_value" decimal NOT NULL,
  "unit_of_measure" varchar NOT NULL,
  "measurement_time" timestamp NOT NULL,
  "observations" text,
  "record_id" integer NOT NULL
);

CREATE TABLE "RECORD_PROCEDURE" (
  "procedure_id" integer PRIMARY KEY,
  "procedure_code" varchar,
  "procedure_name" varchar NOT NULL,
  "procedure_description" text,
  "execution_datetime" timestamp NOT NULL,
  "performed_by" varchar,
  "notes" text,
  "record_id" integer NOT NULL
);

CREATE TABLE "PRESCRIPTION" (
  "prescription_id" integer PRIMARY KEY,
  "medication_name" varchar NOT NULL,
  "medication_code" varchar,
  "dosage" varchar NOT NULL,
  "frequency" varchar NOT NULL,
  "duration" varchar NOT NULL,
  "route" varchar NOT NULL,
  "instructions" text,
  "start_date" date NOT NULL,
  "end_date" date,
  "record_id" integer NOT NULL,
  "professional_id" integer NOT NULL
);

COMMENT ON COLUMN "PATIENT"."patient_id" IS 'Unique identifier for patient';

COMMENT ON COLUMN "PATIENT"."first_name" IS 'Patient first name';

COMMENT ON COLUMN "PATIENT"."middle_name" IS 'Patient middle name';

COMMENT ON COLUMN "PATIENT"."last_name" IS 'Patient last name';

COMMENT ON COLUMN "PATIENT"."matern_name" IS 'Patient maternal surname';

COMMENT ON COLUMN "PATIENT"."date_of_birth" IS 'Patient date of birth';

COMMENT ON COLUMN "PATIENT"."sex" IS 'Patient gender';

COMMENT ON COLUMN "PATIENT"."email" IS 'Patient email address';

COMMENT ON COLUMN "PATIENT"."registration_date" IS 'Registration timestamp';

COMMENT ON COLUMN "PATIENT"."active" IS 'Active status flag';

ALTER TABLE "PATIENT_DOCUMENT" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "PATIENT_ADDRESS" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "PATIENT_PHONE" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "PATIENT_POLICY" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "PATIENT_EMERGENCY_CONTACT" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "PROFESSIONAL_SPECIALTY" ADD FOREIGN KEY ("professional_id") REFERENCES "PROFESSIONAL" ("professional_id");

ALTER TABLE "PROFESSIONAL_SCHEDULE" ADD FOREIGN KEY ("professional_id") REFERENCES "PROFESSIONAL" ("professional_id");

ALTER TABLE "APPOINTMENT" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "APPOINTMENT" ADD FOREIGN KEY ("professional_id") REFERENCES "PROFESSIONAL" ("professional_id");

ALTER TABLE "APPOINTMENT_ROOM" ADD FOREIGN KEY ("appointment_id") REFERENCES "APPOINTMENT" ("appointment_id");

ALTER TABLE "APPOINTMENT" ADD FOREIGN KEY ("appointment_id") REFERENCES "MEDICAL_RECORD" ("appointment_id");

ALTER TABLE "MEDICAL_RECORD" ADD FOREIGN KEY ("patient_id") REFERENCES "PATIENT" ("patient_id");

ALTER TABLE "MEDICAL_RECORD" ADD FOREIGN KEY ("professional_id") REFERENCES "PROFESSIONAL" ("professional_id");

ALTER TABLE "RECORD_DIAGNOSIS" ADD FOREIGN KEY ("record_id") REFERENCES "MEDICAL_RECORD" ("record_id");

ALTER TABLE "RECORD_VITAL_SIGN" ADD FOREIGN KEY ("record_id") REFERENCES "MEDICAL_RECORD" ("record_id");

ALTER TABLE "RECORD_PROCEDURE" ADD FOREIGN KEY ("record_id") REFERENCES "MEDICAL_RECORD" ("record_id");

ALTER TABLE "PRESCRIPTION" ADD FOREIGN KEY ("record_id") REFERENCES "MEDICAL_RECORD" ("record_id");

ALTER TABLE "PRESCRIPTION" ADD FOREIGN KEY ("professional_id") REFERENCES "PROFESSIONAL" ("professional_id");
