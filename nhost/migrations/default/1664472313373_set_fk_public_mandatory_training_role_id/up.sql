alter table "public"."mandatory_training"
  add constraint "mandatory_training_role_id_fkey"
  foreign key ("role_id")
  references "public"."worker_roles"
  ("id") on update restrict on delete restrict;
