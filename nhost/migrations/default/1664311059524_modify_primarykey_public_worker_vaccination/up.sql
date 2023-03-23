BEGIN TRANSACTION;
ALTER TABLE "public"."worker_vaccination" DROP CONSTRAINT "worker_vaccination_pkey";

ALTER TABLE "public"."worker_vaccination"
    ADD CONSTRAINT "worker_vaccination_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
