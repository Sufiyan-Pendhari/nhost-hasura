alter table "public"."shift"
  add constraint "shift_requested_by_fkey"
  foreign key ("requested_by")
  references "public"."bluebee_user"
  ("id") on update restrict on delete restrict;
