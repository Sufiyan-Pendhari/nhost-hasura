alter table "public"."worker_completed_training"
  add constraint "worker_completed_training_user_id_fkey"
  foreign key ("user_id")
  references "public"."worker"
  ("user_id") on update restrict on delete restrict;
