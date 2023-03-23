alter table "public"."worker_selected_roles"
  add constraint "worker_selected_roles_user_id_fkey"
  foreign key ("user_id")
  references "public"."worker"
  ("user_id") on update restrict on delete restrict;
