alter table "public"."overtime"
  add constraint "overtime_requested_by_fkey"
  foreign key ("requested_by")
  references "public"."bluebee_user"
  ("id") on update restrict on delete restrict;
