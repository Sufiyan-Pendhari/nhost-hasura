alter table "public"."payout_status" alter column "id" set default nextval('payout_status_id_seq'::regclass);
alter table "public"."payout_status" alter column "id" drop not null;
alter table "public"."payout_status" add column "id" int4;
