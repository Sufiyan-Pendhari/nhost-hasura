CREATE TABLE "public"."worker_role_wage" ("worker_role_id" integer NOT NULL, "client_id" uuid NOT NULL, "wage" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "id" uuid NOT NULL DEFAULT gen_random_uuid(), PRIMARY KEY ("id") , FOREIGN KEY ("worker_role_id") REFERENCES "public"."worker_roles"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("worker_role_id", "client_id"));
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
CREATE TRIGGER "set_public_worker_role_wage_updated_at"
BEFORE UPDATE ON "public"."worker_role_wage"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_worker_role_wage_updated_at" ON "public"."worker_role_wage" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
