alter table "public"."mandatory_training"
  add constraint "mandatory_training_training_id_fkey"
  foreign key ("training_id")
  references "public"."worker_training"
  ("id") on update restrict on delete restrict;
