-- Связь User Task реализуем в сущности строки таймшита
-- Добавить s
-- Добавить оставшиеся поля, примерно
-- Добавить индексациб, примерно
-- По желанию FK перенести в отдельную секцию после создания таблиц

drop table if exists tt_user cascade;
create table if not exists tt_user (
	id varchar(36) not null primary key
);

drop table if exists tt_job_title cascade;
create table if not exists tt_job_title (
	id varchar(36) not null primary key
);

drop table if exists tt_task cascade;
create table if not exists tt_task (
	id varchar(36) not null primary key	
);

--Строки с клиентом/задаче/ролью и т.п.
drop table if exists tt_timesheet_row cascade;
create table if not exists tt_timesheet_row (
	id varchar(36) not null primary key,
	user_id varchar(36) not null references tt_user (id),
	job_title_id varchar(36) not null references tt_job_title (id),
	task_id varchar(36) not null references tt_task (id)
);

drop table if exists tt_permission cascade;
create table if not exists tt_permission (
	id varchar(36) not null primary key
);

drop table if exists tt_role cascade;
create table if not exists tt_role (
	id varchar(36) not null primary key
);

drop table if exists tt_client cascade;
create table if not exists tt_client (
	id varchar(36) not null primary key
);

drop table if exists tt_project cascade;
create table if not exists tt_project (
	id varchar(36) not null primary key
);

drop table if exists tt_detail cascade;
create table if not exists tt_detail (
	id varchar(36) not null primary key,
	timesheet_id varchar(36) not null references tt_timesheet_row (id),
	work_time time not null,
	work_date date not null,
	description varchar(255)
);

drop table if exists tt_user_role cascade;
create table if not exists tt_user_role (
	id varchar(36) not null primary key,
	user_id varchar(36) not null references tt_user (id),
	role_id varchar(36) not null references tt_role (id)
);

drop table if exists tt_user_job_title cascade;
create table if not exists tt_user_job_title (
	id varchar(36) not null primary key,
	user_id varchar(36) not null references tt_user (id),
	job_title_id varchar(36) not null references tt_job_title (id)
);

drop table if exists tt_role_permission cascade;
create table if not exists tt_role_permission (
	id varchar(36) not null primary key,
	role_id varchar(36) not null references tt_role (id),
	permission_id varchar(36) not null references tt_permission (id)
);

drop table if exists tt_client_project cascade;
create table if not exists tt_client_project (
	id varchar(36) not null primary key,
	client_id varchar(36) not null references tt_client (id),
	project_id varchar(36) not null references tt_project (id)
);

drop table if exists tt_project_task cascade;
create table if not exists tt_project_task (
	id varchar(36) not null primary key,
	project_id varchar(36) not null references tt_project (id),
	task_id varchar(36) not null references tt_task (id)
);

drop table if exists tt_user_client cascade;
create table if not exists tt_user_client (
	id varchar(36) not null primary key,
	user_id varchar(36) not null references tt_user (id),
	client_id varchar(36) not null references tt_client (id)
);

drop table if exists tt_user_project cascade;
create table if not exists tt_user_project (
	id varchar(36) not null primary key,
	user_id varchar(36) not null references tt_user (id),
	project_id varchar(36) not null references tt_project (id)
);