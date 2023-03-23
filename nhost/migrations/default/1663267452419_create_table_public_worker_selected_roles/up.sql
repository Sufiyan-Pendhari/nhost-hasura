CREATE TABLE "public"."worker_selected_roles" ("user_id" uuid NOT NULL, "role_id" integer NOT NULL, "metadata" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("user_id") );
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
CREATE TRIGGER "set_public_worker_selected_roles_updated_at"
BEFORE UPDATE ON "public"."worker_selected_roles"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_worker_selected_roles_updated_at" ON "public"."worker_selected_roles" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
