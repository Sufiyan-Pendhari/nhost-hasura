alter table "public"."shift_notification"
  add constraint "shift_notification_shift_id_fkey"
  foreign key ("shift_id")
  references "public"."shift"
  ("id") on update restrict on delete restrict;
