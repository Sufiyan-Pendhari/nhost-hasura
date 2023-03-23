alter table "public"."worker_accepted_policies"
  add constraint "worker_accepted_policies_policy_id_fkey"
  foreign key ("policy_id")
  references "public"."worker_policy"
  ("id") on update restrict on delete restrict;
