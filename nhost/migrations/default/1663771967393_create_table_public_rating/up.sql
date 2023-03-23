CREATE TABLE "public"."rating" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "shift_id" uuid NOT NULL, "from" uuid NOT NULL, "to" uuid NOT NULL, "value" integer NOT NULL, "extra_data" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("shift_id", "from", "to"), CONSTRAINT "five_star_limit" CHECK (value <= 5));
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
CREATE TRIGGER "set_public_rating_updated_at"
BEFORE UPDATE ON "public"."rating"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_rating_updated_at" ON "public"."rating" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
