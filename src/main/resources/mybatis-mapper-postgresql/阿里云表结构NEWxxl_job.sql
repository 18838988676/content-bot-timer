/*
 Navicat Premium Data Transfer

 Source Server         : pgsql5432
 Source Server Type    : PostgreSQL
 Source Server Version : 90424
 Source Host           : 47.95.246.32:5432
 Source Catalog        : postgres
 Source Schema         : xxl_job

 Target Server Type    : PostgreSQL
 Target Server Version : 90424
 File Encoding         : 65001

 Date: 22/11/2019 15:06:35
*/


-- ----------------------------
-- Sequence structure for xxl_job_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_group_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_info_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_log_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_logglue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_logglue_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_logglue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_registry_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_registry_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_registry_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl_job"."xxl_job_user_id_seq";
CREATE SEQUENCE "xxl_job"."xxl_job_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for fd_content_timer_group
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_group";
CREATE TABLE "xxl_job"."fd_content_timer_group" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_group_id_seq'::regclass),
  "app_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "order" int4 NOT NULL DEFAULT 0,
  "address_type" int2 NOT NULL DEFAULT 0,
  "address_list" varchar(512) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_group"."app_name" IS '执行器AppName';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_group"."title" IS '执行器名称';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_group"."order" IS '排序';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_group"."address_type" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_group"."address_list" IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Table structure for fd_content_timer_info
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_info";
CREATE TABLE "xxl_job"."fd_content_timer_info" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_info_id_seq'::regclass),
  "job_group" int4 NOT NULL,
  "job_cron" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(64) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int4 NOT NULL DEFAULT 0,
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int2 NOT NULL DEFAULT 0,
  "trigger_last_time" int8 NOT NULL DEFAULT 0,
  "trigger_next_time" int8 NOT NULL DEFAULT 0,
  "jobinfogroupparentid" int4
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."job_cron" IS '任务执行CRON';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."author" IS '作者';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."alarm_email" IS '报警邮件';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_route_strategy" IS '执行器路由策略';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_block_strategy" IS '阻塞处理策略';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_timeout" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."glue_remark" IS 'GLUE备注';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."glue_updatetime" IS 'GLUE更新时间';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."child_jobid" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."trigger_status" IS '调度状态：-1：停止 运行；0：停止；1：运行；11：也是运行(指该任务下的公司任务运行，但此任务不允许)；';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."trigger_last_time" IS '上次调度时间';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."trigger_next_time" IS '下次调度时间';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_info"."jobinfogroupparentid" IS '一组任务；指定父id;
-1，复杂任务并具有子任务；
0，简单任务；
非-1、非0：子任务；
';

-- ----------------------------
-- Table structure for fd_content_timer_lock
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_lock";
CREATE TABLE "xxl_job"."fd_content_timer_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_lock"."lock_name" IS '锁名称';

-- ----------------------------
-- Table structure for fd_content_timer_log
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_log";
CREATE TABLE "xxl_job"."fd_content_timer_log" (
  "id" int8 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_log_id_seq'::regclass),
  "job_group" int4 NOT NULL,
  "job_id" int4 NOT NULL,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(20) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "trigger_time" timestamp(6),
  "trigger_code" int4 NOT NULL,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int4 NOT NULL,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."executor_address" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."executor_sharding_param" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."trigger_time" IS '调度-时间';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."trigger_code" IS '调度-结果';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."trigger_msg" IS '调度-日志';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."handle_time" IS '执行-时间';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."handle_code" IS '执行-状态';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."handle_msg" IS '执行-日志';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_log"."alarm_status" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

-- ----------------------------
-- Table structure for fd_content_timer_logglue
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_logglue";
CREATE TABLE "xxl_job"."fd_content_timer_logglue" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_logglue_id_seq'::regclass),
  "job_id" int4 NOT NULL,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_logglue"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_logglue"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_logglue"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_logglue"."glue_remark" IS 'GLUE备注';

-- ----------------------------
-- Table structure for fd_content_timer_registry
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_registry";
CREATE TABLE "xxl_job"."fd_content_timer_registry" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_registry_id_seq'::regclass),
  "registry_group" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for fd_content_timer_user
-- ----------------------------
DROP TABLE IF EXISTS "xxl_job"."fd_content_timer_user";
CREATE TABLE "xxl_job"."fd_content_timer_user" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl_job".xxl_job_user_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl_job"."fd_content_timer_user"."username" IS '账号';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_user"."password" IS '密码';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_user"."role" IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN "xxl_job"."fd_content_timer_user"."permission" IS '权限：执行器ID列表，多个逗号分割';

-- ----------------------------
-- Function structure for update_timestamp
-- ----------------------------
DROP FUNCTION IF EXISTS "xxl_job"."update_timestamp"();
CREATE OR REPLACE FUNCTION "xxl_job"."update_timestamp"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
    BEGIN
        NEW.update_time := now();
        RETURN NEW;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"xxl_job"."xxl_job_group_id_seq"', 10, true);
SELECT setval('"xxl_job"."xxl_job_info_id_seq"', 432, true);
SELECT setval('"xxl_job"."xxl_job_log_id_seq"', 11435, true);
SELECT setval('"xxl_job"."xxl_job_logglue_id_seq"', 4, true);
SELECT setval('"xxl_job"."xxl_job_registry_id_seq"', 173, true);
SELECT setval('"xxl_job"."xxl_job_user_id_seq"', 3, true);

-- ----------------------------
-- Indexes structure for table fd_content_timer_registry
-- ----------------------------
CREATE INDEX "i_g_k_v" ON "xxl_job"."fd_content_timer_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table fd_content_timer_registry
-- ----------------------------
ALTER TABLE "xxl_job"."fd_content_timer_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fd_content_timer_user
-- ----------------------------
CREATE INDEX "i_username" ON "xxl_job"."fd_content_timer_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table fd_content_timer_user
-- ----------------------------
ALTER TABLE "xxl_job"."fd_content_timer_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");
