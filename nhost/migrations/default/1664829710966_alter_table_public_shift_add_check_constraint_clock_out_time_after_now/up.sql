alter table "public"."shift" add constraint "clock_out_time_after_now" check (worker_clock_out_time >= now());
