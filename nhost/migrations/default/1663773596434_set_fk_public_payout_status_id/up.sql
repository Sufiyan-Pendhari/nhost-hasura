alter table "public"."payout"
  add constraint "payout_status_id_fkey"
  foreign key ("status_id")
  references "public"."payout_status"
  ("id") on update restrict on delete restrict;
