BEGIN TRANSACTION;
ALTER TABLE "public"."worker_selected_roles" DROP CONSTRAINT "worker_selected_roles_pkey";

ALTER TABLE "public"."worker_selected_roles"
    ADD CONSTRAINT "worker_selected_roles_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
