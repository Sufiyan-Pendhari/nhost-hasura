alter table "public"."shift"
  add constraint "shift_status_fkey"
  foreign key ("status")
  references "public"."shift_status"
  ("status") on update restrict on delete restrict;
