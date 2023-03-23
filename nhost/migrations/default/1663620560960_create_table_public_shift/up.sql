CREATE TABLE "public"."shift" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "requested_worker_role_id" integer NOT NULL, "wage" integer NOT NULL, "date" date NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz NOT NULL, "time_period" text NOT NULL, "client_id" uuid NOT NULL, "metadata" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("client_id") REFERENCES "public"."client"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("requested_worker_role_id") REFERENCES "public"."worker_roles"("id") ON UPDATE restrict ON DELETE restrict);
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
CREATE TRIGGER "set_public_shift_updated_at"
BEFORE UPDATE ON "public"."shift"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_shift_updated_at" ON "public"."shift" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
