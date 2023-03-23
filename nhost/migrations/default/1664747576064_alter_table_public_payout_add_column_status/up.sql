alter table "public"."payout" add column "status" text
 not null default 'PENDING';
