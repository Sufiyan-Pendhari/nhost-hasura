CREATE TABLE "public"."client" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "cqc_location_id" text NOT NULL, "address" jsonb NOT NULL, "contact" jsonb NOT NULL, "cqc_api_response" jsonb, "bank_details" jsonb NOT NULL, "point_of_contact" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("cqc_location_id"));
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
CREATE TRIGGER "set_public_client_updated_at"
BEFORE UPDATE ON "public"."client"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_client_updated_at" ON "public"."client" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
