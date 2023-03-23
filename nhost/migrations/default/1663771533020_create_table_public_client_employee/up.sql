CREATE TABLE "public"."client_employee" ("user_id" uuid NOT NULL, "client_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("user_id") );
