alter table "public"."client_employee" drop constraint "client_employee_pkey";
alter table "public"."client_employee"
    add constraint "client_employee_pkey"
    primary key ("user_id");
