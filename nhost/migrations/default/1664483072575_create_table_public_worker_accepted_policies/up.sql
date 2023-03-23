CREATE TABLE "public"."worker_accepted_policies" ("id" uuid NOT NULL, "policy_id" integer NOT NULL, "user_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
