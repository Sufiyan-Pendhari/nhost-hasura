CREATE TABLE "public"."worker_policy" ("id" serial NOT NULL, "name" text NOT NULL, "description" text, "tally_form_id" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("tally_form_id"));
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
CREATE TRIGGER "set_public_worker_policy_updated_at"
BEFORE UPDATE ON "public"."worker_policy"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_worker_policy_updated_at" ON "public"."worker_policy" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
