CREATE TABLE "public"."onboarding_application" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "type" text NOT NULL, "completed_at" timestamptz, "completed" boolean NOT NULL DEFAULT false, "data" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "reference" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."bluebee_user"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("reference"), CONSTRAINT "type" CHECK (type in ('worker', 'client')));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_onboarding_application_updated_at"
BEFORE UPDATE ON "public"."onboarding_application"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_onboarding_application_updated_at" ON "public"."onboarding_application" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
