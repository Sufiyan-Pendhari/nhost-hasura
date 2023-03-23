alter table "public"."client_employee"
  add constraint "client_employee_client_id_fkey"
  foreign key ("client_id")
  references "public"."client"
  ("id") on update restrict on delete restrict;
