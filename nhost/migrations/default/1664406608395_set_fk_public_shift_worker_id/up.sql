alter table "public"."shift"
  add constraint "shift_worker_id_fkey"
  foreign key ("worker_id")
  references "public"."worker"
  ("user_id") on update restrict on delete restrict;
