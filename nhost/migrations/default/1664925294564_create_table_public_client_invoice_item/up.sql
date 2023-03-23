CREATE TABLE "public"."client_invoice_item" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "invoice_id" uuid NOT NULL, "name" text NOT NULL, "amount" integer NOT NULL, "metadata" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("invoice_id") REFERENCES "public"."client_invoice"("id") ON UPDATE restrict ON DELETE restrict);
CREATE EXTENSION IF NOT EXISTS pgcrypto;