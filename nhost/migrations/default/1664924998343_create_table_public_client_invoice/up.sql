CREATE TABLE "public"."client_invoice" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "start_period" date NOT NULL, "end_period" date NOT NULL, "has_period_closed" boolean NOT NULL, "total_amount" integer, "client_id" uuid NOT NULL, "status" text NOT NULL DEFAULT 'PENDING', "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("status") REFERENCES "public"."payout_status"("status") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("client_id") REFERENCES "public"."client"("id") ON UPDATE restrict ON DELETE restrict);
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
CREATE TRIGGER "set_public_client_invoice_updated_at"
BEFORE UPDATE ON "public"."client_invoice"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_client_invoice_updated_at" ON "public"."client_invoice" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
