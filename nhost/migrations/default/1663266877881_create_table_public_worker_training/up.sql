CREATE TABLE "public"."worker_training" ("id" serial NOT NULL, "name" text NOT NULL, "description" text NOT NULL, "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_worker_training_updated_at"
BEFORE UPDATE ON "public"."worker_training"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_worker_training_updated_at" ON "public"."worker_training" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
