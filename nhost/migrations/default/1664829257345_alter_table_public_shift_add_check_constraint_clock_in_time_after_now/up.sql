alter table "public"."shift" add constraint "clock_in_time_after_now" check (worker_clock_in_time >= now());
