CREATE TABLE IF NOT EXISTS `{tableName}` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,与业务无关的',
  `job_id` varchar(32) COMMENT '作业ID,程序生成的',
  `job_type` varchar(32) COMMENT '任务类型',
  `priority` int(11) COMMENT '优先级,(数值越大,优先级越低)',
  `retry_times` int(11) DEFAULT '0' COMMENT '重试次数',
  `max_retry_times` int(11) DEFAULT '0' COMMENT '最大重试次数',
  `rely_on_prev_cycle` tinyint(4) COMMENT '是否依赖上一个执行周期',
  `task_id` varchar(64) COMMENT '任务ID,客户端传过来的任务ID',
  `real_task_id` varchar(64) COMMENT '任务ID,客户端传过来的任务ID',
  `gmt_created` bigint(20) COMMENT '创建时间',
  `gmt_modified` bigint(11) COMMENT '修改时间',
  `submit_node_group` varchar(64) COMMENT '提交节点组,提交客户端的节点组',
  `task_tracker_node_group` varchar(64) COMMENT '执行节点组,执行job的任务节点',
  `task_tracker_sub_node_group` varchar(64) COMMENT '执行节点组,执行job的任务子节点',
  `ext_params` text COMMENT '用户参数 JSON',
  `internal_ext_params` text COMMENT '内部扩展参数 JSON',
  `is_running` tinyint(1) COMMENT '是否正在执行',
  `task_tracker_identity` varchar(64) COMMENT 'taskTrackerId,执行的taskTracker的唯一标识',
  `need_feedback` tinyint(4) COMMENT '反馈客户端,是否需要反馈给客户端',
  `cron_expression` varchar(128) COMMENT 'Cron表达式,执行时间表达式 (和 quartz 表达式一样)',
  `trigger_time` bigint(20) COMMENT '下一次执行时间',
  `repeat_count` int(11) DEFAULT '0' COMMENT '重复一次',
  `repeated_count` int(11) DEFAULT '0' COMMENT '已经重复的次数',
  `repeat_interval` bigint(20) DEFAULT '0' COMMENT '重复间隔',
  `last_generate_trigger_time` bigint(20) DEFAULT '0' COMMENT '最后生成的triggerTime时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_job_id` (`job_id`),
  UNIQUE KEY `idx_taskId_taskTrackerNodeGroup_taskTrackerSubNodeGroup` (`task_id`, `task_tracker_node_group`, `task_tracker_sub_node_group`),
  KEY `idx_job_type` (`job_type`),
  KEY `idx_realTaskId_taskTrackerNodeGroup_taskTrackerSubNodeGroup` (`real_task_id`, `task_tracker_node_group`, `task_tracker_sub_node_group`),
  KEY `idx_taskTrackerIdentity` (`task_tracker_identity`),
  KEY `idx_gmtCreated` (`gmt_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='执行中任务';