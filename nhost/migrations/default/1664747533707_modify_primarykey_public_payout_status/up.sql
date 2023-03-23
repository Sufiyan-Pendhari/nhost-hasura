BEGIN TRANSACTION;
ALTER TABLE "public"."payout_status" DROP CONSTRAINT "payout_status_pkey";

ALTER TABLE "public"."payout_status"
    ADD CONSTRAINT "payout_status_pkey" PRIMARY KEY ("status");
COMMIT TRANSACTION;
