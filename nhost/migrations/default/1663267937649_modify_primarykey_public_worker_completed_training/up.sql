BEGIN TRANSACTION;
ALTER TABLE "public"."worker_completed_training" DROP CONSTRAINT "worker_completed_training_pkey";

ALTER TABLE "public"."worker_completed_training"
    ADD CONSTRAINT "worker_completed_training_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
