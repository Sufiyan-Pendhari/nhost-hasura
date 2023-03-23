BEGIN TRANSACTION;
ALTER TABLE "public"."client_employee" DROP CONSTRAINT "client_employee_pkey";

ALTER TABLE "public"."client_employee"
    ADD CONSTRAINT "client_employee_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
