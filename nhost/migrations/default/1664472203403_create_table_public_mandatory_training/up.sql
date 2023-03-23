CREATE TABLE "public"."mandatory_training" ("id" serial NOT NULL, "training_id" integer NOT NULL, "role_id" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
