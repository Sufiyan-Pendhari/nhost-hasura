alter table "public"."worker" add column "created_at" timestamptz
 null default now();
