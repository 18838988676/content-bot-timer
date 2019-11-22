/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云47.95.246.32
 Source Server Type    : PostgreSQL
 Source Server Version : 90424
 Source Host           : 47.95.246.32:5432
 Source Catalog        : postgres
 Source Schema         : xxl_job

 Target Server Type    : PostgreSQL
 Target Server Version : 90424
 File Encoding         : 65001

 Date: 22/11/2019 15:33:53
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
-- Records of fd_content_timer_group
-- ----------------------------
INSERT INTO "xxl_job"."fd_content_timer_group" VALUES (9, 'executorCluster', '执行器集群', 1, 0, '192.168.30.238:9996');
INSERT INTO "xxl_job"."fd_content_timer_group" VALUES (6, 'botbrain-executor01', '测试执行器', 2, 0, NULL);

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
-- Records of fd_content_timer_info
-- ----------------------------
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (182, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:2WIQRCZAPA', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.407245', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/2WIQRCZAPA/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (184, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:INCS7DC3DY', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.427263', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/INCS7DC3DY/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (185, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:ECEBULUGIG', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.454233', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/ECEBULUGIG/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (186, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:EUWUUBXVTC', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.492022', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/EUWUUBXVTC/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (187, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:56RAXZ7ZOT', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.513952', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/56RAXZ7ZOT/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (183, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:AF3NSIWP4X', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.538038', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/AF3NSIWP4X/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (179, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容', '2019-11-20 10:54:52.691548', '2019-11-21 16:29:36.217927', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://attention/v1/inner/{os_key}/update/topic/content","osType":"3","filterOs":[]}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:52.691', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (189, 6, '0 * * * * ?', '刷新dataos', '2019-11-20 11:39:09.753689', '2019-11-20 11:39:09.753689', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://config/v1/inner/os/refresh"}', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.753689', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (181, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:Z74NG1YOGU', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.565067', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/Z74NG1YOGU/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (180, 6, '0 0/10 * * * ?', '刷新mongo技能话题内容任务下发到:DONG86N2WG', '2019-11-20 10:54:55.670994', '2019-11-21 16:29:36.334853', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://attention/v1/inner/DONG86N2WG/update/topic/content', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 10:54:55.67', '', 0, 0, 0, 179);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (190, 6, '0 * * * * ?', '刷新dataos任务下发到:DONG86N2WG', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (191, 6, '0 * * * * ?', '刷新dataos任务下发到:S4EBUTASGJ', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (192, 6, '0 * * * * ?', '刷新dataos任务下发到:CYAE9KBWUN', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (193, 6, '0 * * * * ?', '刷新dataos任务下发到:Z74NG1YOGU', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (194, 6, '0 * * * * ?', '刷新dataos任务下发到:2WIQRCZAPA', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (195, 6, '0 * * * * ?', '刷新dataos任务下发到:AF3NSIWP4X', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (196, 6, '0 * * * * ?', '刷新dataos任务下发到:INCS7DC3DY', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (197, 6, '0 * * * * ?', '刷新dataos任务下发到:ECEBULUGIG', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (198, 6, '0 * * * * ?', '刷新dataos任务下发到:EUWUUBXVTC', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (199, 6, '0 * * * * ?', '刷新dataos任务下发到:56RAXZ7ZOT', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (200, 6, '0 * * * * ?', '刷新dataos任务下发到:QRPRBMINPP', '2019-11-20 11:39:09.968872', '2019-11-20 11:39:09.968872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/os/refresh', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:39:09.968872', '', 0, 0, 0, 189);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (201, 6, '0 0/1 * * * ?', '直播开始前事件触发任务', '2019-11-20 11:41:46.108931', '2019-11-20 11:41:46.108931', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://admin-content/system-schedule/v1/{os_key}/before-start","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.108931', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (202, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:DONG86N2WG', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/DONG86N2WG/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (204, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:2WIQRCZAPA', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/2WIQRCZAPA/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (205, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:AF3NSIWP4X', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/AF3NSIWP4X/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (206, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:INCS7DC3DY', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/INCS7DC3DY/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (207, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:ECEBULUGIG', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/ECEBULUGIG/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (208, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:EUWUUBXVTC', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/EUWUUBXVTC/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (210, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:QRPRBMINPP', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/QRPRBMINPP/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (211, 6, '0 * * * * ?', '刷新open app', '2019-11-20 11:43:01.232792', '2019-11-20 11:43:01.232792', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://config/v1/inner/open/app/refresh"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.232792', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (212, 6, '0 * * * * ?', '刷新open app任务下发到:DONG86N2WG', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (213, 6, '0 * * * * ?', '刷新open app任务下发到:S4EBUTASGJ', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (214, 6, '0 * * * * ?', '刷新open app任务下发到:CYAE9KBWUN', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (215, 6, '0 * * * * ?', '刷新open app任务下发到:Z74NG1YOGU', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (216, 6, '0 * * * * ?', '刷新open app任务下发到:2WIQRCZAPA', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (217, 6, '0 * * * * ?', '刷新open app任务下发到:AF3NSIWP4X', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (218, 6, '0 * * * * ?', '刷新open app任务下发到:INCS7DC3DY', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (219, 6, '0 * * * * ?', '刷新open app任务下发到:ECEBULUGIG', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (220, 6, '0 * * * * ?', '刷新open app任务下发到:EUWUUBXVTC', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (221, 6, '0 * * * * ?', '刷新open app任务下发到:56RAXZ7ZOT', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (222, 6, '0 * * * * ?', '刷新open app任务下发到:QRPRBMINPP', '2019-11-20 11:43:01.493184', '2019-11-20 11:43:01.493184', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://config/v1/inner/open/app/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:43:01.493184', '', 0, 0, 0, 211);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (223, 6, '0 0/1 * * * ?', '培训考试通知', '2019-11-20 11:45:27.067038', '2019-11-20 11:45:27.067038', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://training/v1/{os_key}/notify/training/exam","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.067038', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (224, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:DONG86N2WG', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/DONG86N2WG/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (225, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:Z74NG1YOGU', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/Z74NG1YOGU/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (226, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:2WIQRCZAPA', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/2WIQRCZAPA/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (227, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:AF3NSIWP4X', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/AF3NSIWP4X/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (229, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:ECEBULUGIG', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/ECEBULUGIG/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (230, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:EUWUUBXVTC', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/EUWUUBXVTC/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (231, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:56RAXZ7ZOT', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/56RAXZ7ZOT/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (232, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:QRPRBMINPP', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/QRPRBMINPP/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (233, 6, '0 0/1 * * * ?', '培训结束15分钟后', '2019-11-20 11:46:33.276816', '2019-11-20 11:46:33.276816', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://training/v1/schedule/{os_key}/push-msg/after15","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.276816', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (234, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:DONG86N2WG', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/DONG86N2WG/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (235, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:Z74NG1YOGU', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/Z74NG1YOGU/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (236, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:2WIQRCZAPA', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/2WIQRCZAPA/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (237, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:AF3NSIWP4X', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/AF3NSIWP4X/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (238, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:INCS7DC3DY', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/INCS7DC3DY/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (239, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:ECEBULUGIG', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/ECEBULUGIG/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (240, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:EUWUUBXVTC', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/EUWUUBXVTC/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (241, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:56RAXZ7ZOT', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/56RAXZ7ZOT/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (242, 6, '0 0/1 * * * ?', '培训结束15分钟后任务下发到:QRPRBMINPP', '2019-11-20 11:46:33.468204', '2019-11-20 11:46:33.468204', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/QRPRBMINPP/push-msg/after15', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:46:33.468204', '', 0, 0, 0, 233);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (243, 6, '0 0/5 * * * ?', '消息模板刷新', '2019-11-20 11:47:55.291466', '2019-11-20 11:47:55.291466', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://push/v1/inner/template/refresh"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.291466', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (244, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:DONG86N2WG', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (245, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:S4EBUTASGJ', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (246, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:CYAE9KBWUN', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (247, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:Z74NG1YOGU', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (248, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:2WIQRCZAPA', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (249, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:AF3NSIWP4X', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (250, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:INCS7DC3DY', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (251, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:ECEBULUGIG', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (252, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:EUWUUBXVTC', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (254, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:QRPRBMINPP', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (255, 6, '0 0/1 * * * ?', '直播开始事件触发任务', '2019-11-20 11:49:34.214353', '2019-11-20 11:49:34.214353', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://admin-content/system-schedule/v1/{os_key}/start","osType":"3"}', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.214353', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (256, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:DONG86N2WG', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/DONG86N2WG/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (257, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:Z74NG1YOGU', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/Z74NG1YOGU/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (258, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:2WIQRCZAPA', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/2WIQRCZAPA/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (259, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:AF3NSIWP4X', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/AF3NSIWP4X/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (260, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:INCS7DC3DY', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/INCS7DC3DY/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (261, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:ECEBULUGIG', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/ECEBULUGIG/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (262, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:EUWUUBXVTC', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/EUWUUBXVTC/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (263, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:56RAXZ7ZOT', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/56RAXZ7ZOT/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (264, 6, '0 0/1 * * * ?', '直播开始事件触发任务任务下发到:QRPRBMINPP', '2019-11-20 11:49:34.72836', '2019-11-20 11:49:34.72836', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/QRPRBMINPP/start', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:49:34.72836', '', 0, 0, 0, 255);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (265, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传', '2019-11-20 11:51:00.602829', '2019-11-20 11:51:00.602829', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://upload/v1/{os_key}/check/no/transcode/video","osType":"3"}', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.602829', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (266, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:DONG86N2WG', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/DONG86N2WG/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (267, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:Z74NG1YOGU', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/Z74NG1YOGU/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (268, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:2WIQRCZAPA', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/2WIQRCZAPA/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (269, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:AF3NSIWP4X', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/AF3NSIWP4X/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (270, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:INCS7DC3DY', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/INCS7DC3DY/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (271, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:ECEBULUGIG', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/ECEBULUGIG/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (272, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:EUWUUBXVTC', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/EUWUUBXVTC/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (273, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:56RAXZ7ZOT', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/56RAXZ7ZOT/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (274, 6, '0 0/3 * * * ?', '查询上传成功后未回调的视频并再上传任务下发到:QRPRBMINPP', '2019-11-20 11:51:00.750909', '2019-11-20 11:51:00.750909', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/QRPRBMINPP/check/no/transcode/video', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:51:00.750909', '', 0, 0, 0, 265);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (275, 6, '0/1 * * * * ?', '重算结果回调', '2019-11-20 11:53:05.74808', '2019-11-20 11:53:05.74808', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://calculate/inner/v1/kp-calculate/callback"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.74808', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (299, 6, '0 0/1 * * * ?', '培训当天,开始前两小时', '2019-11-20 11:56:49.052062', '2019-11-20 11:56:49.052062', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://training/v1/schedule/{os_key}/push-msg/intraday","osType":"3"}', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.052062', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (277, 6, '0/1 * * * * ?', '重算结果回调任务下发到:S4EBUTASGJ', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (278, 6, '0/1 * * * * ?', '重算结果回调任务下发到:CYAE9KBWUN', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (279, 6, '0/1 * * * * ?', '重算结果回调任务下发到:Z74NG1YOGU', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (280, 6, '0/1 * * * * ?', '重算结果回调任务下发到:2WIQRCZAPA', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (281, 6, '0/1 * * * * ?', '重算结果回调任务下发到:AF3NSIWP4X', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (282, 6, '0/1 * * * * ?', '重算结果回调任务下发到:INCS7DC3DY', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (283, 6, '0/1 * * * * ?', '重算结果回调任务下发到:ECEBULUGIG', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (284, 6, '0/1 * * * * ?', '重算结果回调任务下发到:EUWUUBXVTC', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (285, 6, '0/1 * * * * ?', '重算结果回调任务下发到:56RAXZ7ZOT', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (286, 6, '0/1 * * * * ?', '重算结果回调任务下发到:QRPRBMINPP', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (288, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:DONG86N2WG', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/DONG86N2WG/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (289, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:S4EBUTASGJ', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/S4EBUTASGJ/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (290, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:CYAE9KBWUN', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/CYAE9KBWUN/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (291, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:Z74NG1YOGU', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/Z74NG1YOGU/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (292, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:2WIQRCZAPA', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/2WIQRCZAPA/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (293, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:AF3NSIWP4X', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/AF3NSIWP4X/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (294, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:INCS7DC3DY', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/INCS7DC3DY/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (295, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:ECEBULUGIG', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/ECEBULUGIG/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (296, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:EUWUUBXVTC', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/EUWUUBXVTC/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (297, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:56RAXZ7ZOT', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/56RAXZ7ZOT/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (298, 6, '0 0/1 * * * ?', '培训开始前24小时任务下发到:QRPRBMINPP', '2019-11-20 11:54:17.550012', '2019-11-20 11:54:17.550012', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/QRPRBMINPP/push-msg/before24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.550012', '', 0, 0, 0, 287);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (287, 6, '0 0/1 * * * ?', '培训开始前24小时', '2019-11-20 11:54:17.143016', '2019-11-20 11:54:49.589557', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://training/v1/schedule/{os_key}/push-msg/before24","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:54:17.143', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (301, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:Z74NG1YOGU', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/Z74NG1YOGU/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (302, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:2WIQRCZAPA', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/2WIQRCZAPA/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (303, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:AF3NSIWP4X', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/AF3NSIWP4X/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (304, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:INCS7DC3DY', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/INCS7DC3DY/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (306, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:EUWUUBXVTC', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/EUWUUBXVTC/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (307, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:56RAXZ7ZOT', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/56RAXZ7ZOT/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (308, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:QRPRBMINPP', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/QRPRBMINPP/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (309, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis', '2019-11-20 11:59:54.573898', '2019-11-20 11:59:54.573898', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://content/v1/{os_key}/put/content/2/redis","osType":"3"}', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.573898', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (310, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:DONG86N2WG', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/DONG86N2WG/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (311, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:Z74NG1YOGU', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/Z74NG1YOGU/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (312, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:2WIQRCZAPA', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/2WIQRCZAPA/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (313, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:AF3NSIWP4X', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/AF3NSIWP4X/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (314, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:INCS7DC3DY', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/INCS7DC3DY/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (315, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:ECEBULUGIG', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/ECEBULUGIG/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (316, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:EUWUUBXVTC', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/EUWUUBXVTC/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (317, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:56RAXZ7ZOT', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/56RAXZ7ZOT/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (318, 6, '0 0/10 * * * ?', '定时添加运营位内容到redis任务下发到:QRPRBMINPP', '2019-11-20 11:59:54.745126', '2019-11-20 11:59:54.745126', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://content/v1/QRPRBMINPP/put/content/2/redis', 'SERIAL_EXECUTION', 500, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:59:54.745126', '', 0, 0, 0, 309);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (319, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时', '2019-11-20 12:01:25.864191', '2019-11-20 12:01:25.864191', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://at/system-schedule/v1/{os_key}/sendMsgAt8","osType":"3"}', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:25.864191', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (320, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:DONG86N2WG', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/DONG86N2WG/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (321, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:Z74NG1YOGU', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/Z74NG1YOGU/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (322, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:2WIQRCZAPA', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/2WIQRCZAPA/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (323, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:AF3NSIWP4X', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/AF3NSIWP4X/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (325, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:ECEBULUGIG', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/ECEBULUGIG/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (326, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:EUWUUBXVTC', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/EUWUUBXVTC/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (327, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:56RAXZ7ZOT', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/56RAXZ7ZOT/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (328, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:QRPRBMINPP', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/QRPRBMINPP/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (330, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)', '2019-11-20 12:18:54.022721', '2019-11-20 12:18:54.022721', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://at/system-schedule/v1/{os_key}/task-end/remind"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:54.022721', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (331, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:DONG86N2WG', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/DONG86N2WG/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (332, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:S4EBUTASGJ', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/S4EBUTASGJ/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (333, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:CYAE9KBWUN', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/CYAE9KBWUN/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (334, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:Z74NG1YOGU', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/Z74NG1YOGU/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (335, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:2WIQRCZAPA', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/2WIQRCZAPA/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (336, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:AF3NSIWP4X', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/AF3NSIWP4X/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (337, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:INCS7DC3DY', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/INCS7DC3DY/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (338, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:ECEBULUGIG', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/ECEBULUGIG/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (339, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:EUWUUBXVTC', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/EUWUUBXVTC/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (340, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:56RAXZ7ZOT', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/56RAXZ7ZOT/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (341, 6, '0 0/1 * * * ?', '任务截止给发布者(任务完成提醒)任务下发到:QRPRBMINPP', '2019-11-20 12:18:55.457579', '2019-11-20 12:18:55.457579', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/QRPRBMINPP/task-end/remind', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:18:55.457579', '', 0, 0, 0, 330);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (342, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务', '2019-11-20 12:23:51.404872', '2019-11-20 12:23:51.404872', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://at/system-schedule/v1/{os_key}/sendMsgBefore24","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:51.404872', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (343, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:DONG86N2WG', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/DONG86N2WG/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (344, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:Z74NG1YOGU', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/Z74NG1YOGU/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (345, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:2WIQRCZAPA', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/2WIQRCZAPA/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (346, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:AF3NSIWP4X', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/AF3NSIWP4X/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (329, 6, '0 * * * * ?', '图片内容合法鉴别', '2019-11-20 12:17:30.053089', '2019-11-20 12:17:30.053089', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/2WIQRCZAPA/cloud/flush/file?type=image,audio', 'SERIAL_EXECUTION', 200, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:17:30.053089', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (347, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:INCS7DC3DY', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/INCS7DC3DY/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (348, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:ECEBULUGIG', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/ECEBULUGIG/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (349, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:EUWUUBXVTC', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/EUWUUBXVTC/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (350, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:56RAXZ7ZOT', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/56RAXZ7ZOT/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (351, 6, '0 0 0/1 * * ?', '任务系统逾期前24小时任务任务下发到:QRPRBMINPP', '2019-11-20 12:23:52.763652', '2019-11-20 12:23:52.763652', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/QRPRBMINPP/sendMsgBefore24', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:23:52.763652', '', 0, 0, 0, 342);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (355, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息', '2019-11-20 12:29:50.754372', '2019-11-20 12:29:50.754372', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"https://api.botbrain.ai/real/v1/{os_key}/zhiyuPost"}', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:50.754372', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (356, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:DONG86N2WG', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/DONG86N2WG/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (357, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:S4EBUTASGJ', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/S4EBUTASGJ/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (358, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:CYAE9KBWUN', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/CYAE9KBWUN/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (359, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:Z74NG1YOGU', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/Z74NG1YOGU/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (360, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:2WIQRCZAPA', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/2WIQRCZAPA/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (361, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:AF3NSIWP4X', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/AF3NSIWP4X/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (362, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:INCS7DC3DY', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/INCS7DC3DY/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (363, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:ECEBULUGIG', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/ECEBULUGIG/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (364, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:EUWUUBXVTC', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/EUWUUBXVTC/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (365, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:56RAXZ7ZOT', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/56RAXZ7ZOT/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (366, 6, '0 0 0-23 * * ?', '定时刷新知鱼职位信息任务下发到:QRPRBMINPP', '2019-11-20 12:29:51.008431', '2019-11-20 12:29:51.008431', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'https://api.botbrain.ai/real/v1/QRPRBMINPP/zhiyuPost', 'SERIAL_EXECUTION', 300, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:29:51.008431', '', 0, 0, 0, 355);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (353, 6, '0/3 * * * * ?', '重算结果执行', '2019-11-20 12:27:39.097379', '2019-11-20 12:27:39.097379', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/execute', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:27:39.097379', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (367, 6, '0/30 * * * * ?', '定时加载问答相关的内容', '2019-11-20 12:31:06.47192', '2019-11-20 12:31:06.47192', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://sidecar-qa-sim/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:31:06.47192', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (368, 6, '0 0 3 * * ?', '定时清理转码redis缓存', '2019-11-20 12:32:27.02182', '2019-11-20 12:32:27.02182', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://upload/v1/{os_key}/clear/trans/redis/cache","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.02182', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (369, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:DONG86N2WG', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/DONG86N2WG/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (370, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:Z74NG1YOGU', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/Z74NG1YOGU/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (371, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:2WIQRCZAPA', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/2WIQRCZAPA/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (372, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:AF3NSIWP4X', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/AF3NSIWP4X/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (373, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:INCS7DC3DY', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/INCS7DC3DY/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (374, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:ECEBULUGIG', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/ECEBULUGIG/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (375, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:EUWUUBXVTC', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/EUWUUBXVTC/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (376, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:56RAXZ7ZOT', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/56RAXZ7ZOT/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (377, 6, '0 0 3 * * ?', '定时清理转码redis缓存任务下发到:QRPRBMINPP', '2019-11-20 12:32:27.275924', '2019-11-20 12:32:27.275924', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://upload/v1/QRPRBMINPP/clear/trans/redis/cache', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:32:27.275924', '', 0, 0, 0, 368);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (378, 6, '0 0 0 * * ?', '热门知识点统计', '2019-11-20 12:33:47.325452', '2019-11-20 12:33:47.325452', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://topic/v1/{os_key}/knowledge/hot-statistics-task","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.325452', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (379, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:DONG86N2WG', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/DONG86N2WG/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (380, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:Z74NG1YOGU', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/Z74NG1YOGU/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (381, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:2WIQRCZAPA', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/2WIQRCZAPA/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (382, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:AF3NSIWP4X', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/AF3NSIWP4X/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (383, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:INCS7DC3DY', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/INCS7DC3DY/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (384, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:ECEBULUGIG', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/ECEBULUGIG/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (385, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:EUWUUBXVTC', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/EUWUUBXVTC/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (386, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:56RAXZ7ZOT', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/56RAXZ7ZOT/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (387, 6, '0 0 0 * * ?', '热门知识点统计任务下发到:QRPRBMINPP', '2019-11-20 12:33:47.510371', '2019-11-20 12:33:47.510371', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://topic/v1/QRPRBMINPP/knowledge/hot-statistics-task', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:33:47.510371', '', 0, 0, 0, 378);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (388, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步', '2019-11-20 13:12:36.443341', '2019-11-20 13:12:36.443341', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://calculate/inner/v1/cloud/sync/content?os_key={os_key}","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.443341', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (354, 6, '0/2 * * * * ?', '爬虫图文入库', '2019-11-20 12:28:28.05636', '2019-11-20 12:28:28.05636', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/import/content', 'SERIAL_EXECUTION', 120, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:28:28.05636', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (390, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:Z74NG1YOGU', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=Z74NG1YOGU', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (391, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:2WIQRCZAPA', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=2WIQRCZAPA', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (392, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:AF3NSIWP4X', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=AF3NSIWP4X', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (393, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:INCS7DC3DY', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=INCS7DC3DY', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (394, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:ECEBULUGIG', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=ECEBULUGIG', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (395, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:EUWUUBXVTC', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=EUWUUBXVTC', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (396, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:56RAXZ7ZOT', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=56RAXZ7ZOT', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (397, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:QRPRBMINPP', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=QRPRBMINPP', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (398, 6, '1/30 * * * * ?', '考试问卷提交', '2019-11-20 13:13:43.906936', '2019-11-20 13:13:43.906936', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://exam/system-schedule/v1/{os_key}/record-commit","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:43.906936', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (399, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:DONG86N2WG', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/DONG86N2WG/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (400, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:Z74NG1YOGU', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/Z74NG1YOGU/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (401, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:2WIQRCZAPA', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/2WIQRCZAPA/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (402, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:AF3NSIWP4X', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/AF3NSIWP4X/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (403, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:INCS7DC3DY', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/INCS7DC3DY/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (404, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:ECEBULUGIG', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/ECEBULUGIG/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (405, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:EUWUUBXVTC', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/EUWUUBXVTC/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (406, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:56RAXZ7ZOT', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/56RAXZ7ZOT/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (407, 6, '1/30 * * * * ?', '考试问卷提交任务下发到:QRPRBMINPP', '2019-11-20 13:13:44.036651', '2019-11-20 13:13:44.036651', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://exam/system-schedule/v1/QRPRBMINPP/record-commit', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:13:44.036651', '', 0, 0, 0, 398);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (408, 6, '1/30 * * * * ?', '考试开始关闭', '2019-11-20 13:14:45.785566', '2019-11-20 13:14:45.785566', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://admin-exam/system-schedule/v1/{os_key}/start-close","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.785566', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (409, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:DONG86N2WG', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/DONG86N2WG/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (410, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:Z74NG1YOGU', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/Z74NG1YOGU/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (411, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:2WIQRCZAPA', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/2WIQRCZAPA/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (203, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:Z74NG1YOGU', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/Z74NG1YOGU/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (209, 6, '0 0/1 * * * ?', '直播开始前事件触发任务任务下发到:56RAXZ7ZOT', '2019-11-20 11:41:46.272228', '2019-11-20 11:41:46.272228', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/system-schedule/v1/56RAXZ7ZOT/before-start', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:41:46.272228', '', 0, 0, 0, 201);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (228, 6, '0 0/1 * * * ?', '培训考试通知任务下发到:INCS7DC3DY', '2019-11-20 11:45:27.270707', '2019-11-20 11:45:27.270707', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/INCS7DC3DY/notify/training/exam', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:45:27.270707', '', 0, 0, 0, 223);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (253, 6, '0 0/5 * * * ?', '消息模板刷新任务下发到:56RAXZ7ZOT', '2019-11-20 11:47:55.509742', '2019-11-20 11:47:55.509742', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://push/v1/inner/template/refresh', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:47:55.509742', '', 0, 0, 0, 243);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (276, 6, '0/1 * * * * ?', '重算结果回调任务下发到:DONG86N2WG', '2019-11-20 11:53:05.944324', '2019-11-20 11:53:05.944324', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/kp-calculate/callback', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:53:05.944324', '', 0, 0, 0, 275);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (300, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:DONG86N2WG', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/DONG86N2WG/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (305, 6, '0 0/1 * * * ?', '培训当天,开始前两小时任务下发到:ECEBULUGIG', '2019-11-20 11:56:49.284658', '2019-11-20 11:56:49.284658', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://training/v1/schedule/ECEBULUGIG/push-msg/intraday', 'SERIAL_EXECUTION', 30, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 11:56:49.284658', '', 0, 0, 0, 299);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (324, 6, '0 0/1 * * * ?', '任务系统逾期后24,48,72小时任务下发到:INCS7DC3DY', '2019-11-20 12:01:26.066275', '2019-11-20 12:01:26.066275', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://at/system-schedule/v1/INCS7DC3DY/sendMsgAt8', 'SERIAL_EXECUTION', 10, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:01:26.066275', '', 0, 0, 0, 319);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (413, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:INCS7DC3DY', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/INCS7DC3DY/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (414, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:ECEBULUGIG', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/ECEBULUGIG/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (415, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:EUWUUBXVTC', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/EUWUUBXVTC/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (416, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:56RAXZ7ZOT', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/56RAXZ7ZOT/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (417, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:QRPRBMINPP', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/QRPRBMINPP/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (418, 6, '0 */3 * * * ?', '定时更新运营位内容', '2019-11-20 13:16:27.322199', '2019-11-20 13:16:27.322199', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"http://admin-content/v1/{os_key}/update/opera/content","osType":"3"}', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.322199', '', 0, 0, 0, -1);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (419, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:DONG86N2WG', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/DONG86N2WG/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (420, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:Z74NG1YOGU', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/Z74NG1YOGU/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (421, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:2WIQRCZAPA', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/2WIQRCZAPA/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (422, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:AF3NSIWP4X', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/AF3NSIWP4X/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (423, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:INCS7DC3DY', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/INCS7DC3DY/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (424, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:ECEBULUGIG', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/ECEBULUGIG/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (425, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:EUWUUBXVTC', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/EUWUUBXVTC/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (426, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:56RAXZ7ZOT', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/56RAXZ7ZOT/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (427, 6, '0 */3 * * * ?', '定时更新运营位内容任务下发到:QRPRBMINPP', '2019-11-20 13:16:27.472279', '2019-11-20 13:16:27.472279', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-content/v1/QRPRBMINPP/update/opera/content', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:16:27.472279', '', 0, 0, 0, 418);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (352, 6, '0 30 8 * * ?', '每日推荐 08:30  -->oskey只推送2W的', '2019-11-20 12:26:07.868195', '2019-11-20 12:26:07.868195', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', '{"url":"https://fish/v1/2WIQRCZAPA/schedule/push/daily/recommend"}', 'SERIAL_EXECUTION', 600, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 12:26:07.868195', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (389, 6, '0/5 * * * * ?', '重算云知识库向小库内容同步任务下发到:DONG86N2WG', '2019-11-20 13:12:36.592464', '2019-11-20 13:12:36.592464', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://calculate/inner/v1/cloud/sync/content?os_key=DONG86N2WG', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:12:36.592464', '', 0, 0, 0, 388);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (412, 6, '1/30 * * * * ?', '考试开始关闭任务下发到:AF3NSIWP4X', '2019-11-20 13:14:45.922219', '2019-11-20 13:14:45.922219', 'test', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyInner', 'http://admin-exam/system-schedule/v1/AF3NSIWP4X/start-close', 'SERIAL_EXECUTION', 30, 1, 'BEAN', '', 'GLUE代码初始化', '2019-11-20 13:14:45.922219', '', 0, 0, 0, 408);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (429, 6, '4,14,24,34,44,54 * * * * ?', 'test', '2019-11-21 14:09:45.09254', '2019-11-21 18:44:58.494094', 'wmc', 'wangmingchao@botbrain.cn', 'FIRST', 'HttpJobHandlerOskeyOuter', 'https://testapi.botbrain.ai/attention/v1/inner/2WIQRCZAPA/update/topic/content', 'SERIAL_EXECUTION', 50, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-21 14:09:45.092', '', 0, 0, 0, 0);
INSERT INTO "xxl_job"."fd_content_timer_info" VALUES (430, 9, '3 * * * * ?', 'test2', '2019-11-22 11:34:20.249911', '2019-11-22 15:15:25.650739', 'wmc', 'wangmingchao@botbrain.cn', 'FIRST', 'httpJobHandler', 'http://localhost:8839/attention/v1/inner/2WIQRCZAPA/update/topic/content', 'SERIAL_EXECUTION', 60, 0, 'BEAN', '', 'GLUE代码初始化', '2019-11-22 11:34:20.249', '', 0, 0, 0, 0);

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
-- Records of fd_content_timer_log
-- ----------------------------
INSERT INTO "xxl_job"."fd_content_timer_log" VALUES (11435, 9, 430, '192.168.30.238:9996', 'httpJobHandler', 'http://localhost:8839/attention/v1/inner/2WIQRCZAPA/update/topic/content', NULL, 0, '2019-11-22 15:15:06.418', 500, '任务触发类型：手动触发<br>调度机器：192.168.30.238<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.30.238:9996]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：60<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.30.238:9996<br>code：500<br>msg：com.xxl.rpc.util.XxlRpcException: xxl-rpc, request timeout at:1574406909696, request:XxlRpcRequest{requestId=''d4c88d8f-cd59-4a65-808b-a67a80f512fe'', createMillisTime=1574406906549, accessToken='''', className=''com.xxl.job.core.biz.ExecutorBiz'', methodName=''run'', parameterTypes=[class com.xxl.job.core.biz.model.TriggerParam], parameters=[TriggerParam{jobId=430, executorHandler=''httpJobHandler'', executorParams=''http://localhost:8839/attention/v1/inner/2WIQRCZAPA/update/topic/content'', executorBlockStrategy=''SERIAL_EXECUTION'', executorTimeout=60, logId=11435, logDateTim=1574406906418, glueType=''BEAN'', glueSource='''', glueUpdatetime=1574393660249, broadcastIndex=0, broadcastTotal=1}], version=''null''}
	at com.xxl.rpc.remoting.net.params.XxlRpcFutureResponse.get(XxlRpcFutureResponse.java:117)
	at com.xxl.rpc.remoting.invoker.reference.XxlRpcReferenceBean$1.invoke(XxlRpcReferenceBean.java:219)
	at com.sun.proxy.$Proxy165.run(Unknown Source)
	at com.botbrain.timer.core.trigger.XxlJobTrigger.runExecutor(XxlJobTrigger.java:196)
	at com.botbrain.timer.core.trigger.XxlJobTrigger.processTrigger(XxlJobTrigger.java:149)
	at com.botbrain.timer.core.trigger.XxlJobTrigger.trigger(XxlJobTrigger.java:74)
	at com.botbrain.timer.core.thread.JobTriggerPoolHelper$3.run(JobTriggerPoolHelper.java:76)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
', '2019-11-22 15:15:10.736', 500, '', 2);

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
-- Records of fd_content_timer_user
-- ----------------------------
INSERT INTO "xxl_job"."fd_content_timer_user" VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO "xxl_job"."fd_content_timer_user" VALUES (2, 'wmc123', '96e79218965eb72c92a549dd5a330112', 1, '');

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
SELECT setval('"xxl_job"."xxl_job_log_id_seq"', 11436, true);
SELECT setval('"xxl_job"."xxl_job_logglue_id_seq"', 4, true);
SELECT setval('"xxl_job"."xxl_job_registry_id_seq"', 179, true);
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
