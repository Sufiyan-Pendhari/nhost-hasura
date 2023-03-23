alter table "public"."worker_vaccination" drop constraint "worker_vaccination_pkey";
alter table "public"."worker_vaccination"
    add constraint "worker_vaccination_pkey"
    primary key ("user_id");
