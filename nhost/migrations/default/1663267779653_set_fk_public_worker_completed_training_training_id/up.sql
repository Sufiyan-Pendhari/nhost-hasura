alter table "public"."worker_completed_training"
  add constraint "worker_completed_training_training_id_fkey"
  foreign key ("training_id")
  references "public"."worker_training"
  ("id") on update restrict on delete restrict;
