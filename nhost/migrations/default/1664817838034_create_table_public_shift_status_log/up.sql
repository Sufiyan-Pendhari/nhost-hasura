CREATE TABLE "public"."shift_status_log" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "shift_id" uuid NOT NULL, "status" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("shift_id") REFERENCES "public"."shift"("id") ON UPDATE restrict ON DELETE restrict);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
