alter table "public"."payout" alter column "status_id" set default 2;
alter table "public"."payout"
  add constraint "payout_status_id_fkey"
  foreign key (status_id)
  references "public"."payout_status"
  (id) on update restrict on delete restrict;
alter table "public"."payout" alter column "status_id" drop not null;
alter table "public"."payout" add column "status_id" int4;
