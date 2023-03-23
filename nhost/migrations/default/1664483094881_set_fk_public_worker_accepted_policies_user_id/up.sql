alter table "public"."worker_accepted_policies"
  add constraint "worker_accepted_policies_user_id_fkey"
  foreign key ("user_id")
  references "public"."worker"
  ("user_id") on update restrict on delete restrict;
