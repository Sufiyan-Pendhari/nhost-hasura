alter table "public"."shift_status_log"
  add constraint "shift_status_log_worker_id_fkey"
  foreign key ("worker_id")
  references "public"."worker"
  ("user_id") on update restrict on delete restrict;
