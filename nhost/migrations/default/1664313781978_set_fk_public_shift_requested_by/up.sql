alter table "public"."shift"
  add constraint "shift_requested_by_fkey"
  foreign key ("requested_by")
  references "public"."client_employee"
  ("user_id") on update restrict on delete restrict;
