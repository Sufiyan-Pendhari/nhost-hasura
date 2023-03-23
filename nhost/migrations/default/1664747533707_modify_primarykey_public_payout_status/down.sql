alter table "public"."payout_status" drop constraint "payout_status_pkey";
alter table "public"."payout_status"
    add constraint "payout_status_pkey"
    primary key ("id");
