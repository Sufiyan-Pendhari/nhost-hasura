alter table "public"."worker_selected_roles" drop constraint "worker_selected_roles_pkey";
alter table "public"."worker_selected_roles"
    add constraint "worker_selected_roles_pkey"
    primary key ("user_id");
