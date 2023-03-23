alter table "public"."worker_completed_training" drop constraint "worker_completed_training_pkey";
alter table "public"."worker_completed_training"
    add constraint "worker_completed_training_pkey"
    primary key ("user_id");
