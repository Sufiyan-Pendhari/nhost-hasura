alter table "public"."payout"
  add constraint "payout_status_fkey"
  foreign key ("status")
  references "public"."payout_status"
  ("status") on update restrict on delete restrict;
