alter table "public"."client_employee"
  add constraint "client_employee_user_id_fkey"
  foreign key ("user_id")
  references "public"."bluebee_user"
  ("id") on update restrict on delete restrict;
