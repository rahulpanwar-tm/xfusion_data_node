

-- Dumping database structure for xfusion_performance_data_node_1
DROP DATABASE IF EXISTS `xfusion_performance_data_node_1`;
CREATE DATABASE IF NOT EXISTS `xfusion_performance_data_node_1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xfusion_performance_data_node_1`;

-- Dumping structure for table xfusion_performance_data_node_1.performance_command
DROP TABLE IF EXISTS `performance_command`;
CREATE TABLE IF NOT EXISTS `performance_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-Incremented Unique Id ',
  `device_id` int(11) NOT NULL COMMENT 'Device id for Device Identification',
  `name` varchar(45) DEFAULT NULL COMMENT 'command name. (Tells which command is gonna execute)',
  `command` varchar(255) DEFAULT NULL COMMENT 'Actual command which is gonna execute directly as it is',
  `creation_time` int(11) DEFAULT NULL COMMENT 'Creation time of command.  Stored in Unix Time',
  `response_time` int(11) DEFAULT NULL COMMENT 'Time at which command has given its response. Stored in Unix Time',
  `user_key` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `response` varchar(2056) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `command_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_commandstatus
DROP TABLE IF EXISTS `performance_commandstatus`;
CREATE TABLE IF NOT EXISTS `performance_commandstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-Incremented Unique Id ',
  `device_id` int(11) NOT NULL COMMENT 'Device id for Device Identification',
  `name` varchar(45) DEFAULT NULL COMMENT 'command name. (Tells which command is gonna execute)',
  `command` varchar(255) DEFAULT NULL COMMENT 'Actual command which is gonna execute directly as it is',
  `creation_time` int(11) DEFAULT NULL COMMENT 'Creation time of command.  Stored in Unix Time',
  `response_time` int(11) DEFAULT NULL COMMENT 'Time at which command has given its response. Stored in Unix Time',
  `user_key` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `response` varchar(2056) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `command_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_eventstatus
DROP TABLE IF EXISTS `performance_eventstatus`;
CREATE TABLE IF NOT EXISTS `performance_eventstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `rule_id` bigint(20) DEFAULT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  `severity_colour` varchar(255) DEFAULT NULL,
  `severity_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`device_id`),
  UNIQUE KEY `uq_device_service_datasource` (`device_id`,`service_name`,`data_source`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_inventorystatus
DROP TABLE IF EXISTS `performance_inventorystatus`;
CREATE TABLE IF NOT EXISTS `performance_inventorystatus` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_device_service_datasource` (`device_id`,`service_name`,`data_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceevent
DROP TABLE IF EXISTS `performance_performanceevent`;
CREATE TABLE IF NOT EXISTS `performance_performanceevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `rule_id` bigint(20) DEFAULT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  `severity_colour` varchar(255) DEFAULT NULL,
  `severity_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory
DROP TABLE IF EXISTS `performance_performanceinventory`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`),
  KEY `service_name` (`service_name`),
  KEY `data_source` (`data_source`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_bi_hourly
DROP TABLE IF EXISTS `performance_performanceinventory_bi_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_bi_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_daily
DROP TABLE IF EXISTS `performance_performanceinventory_daily`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_half_hourly
DROP TABLE IF EXISTS `performance_performanceinventory_half_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_half_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_hourly
DROP TABLE IF EXISTS `performance_performanceinventory_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_monthly
DROP TABLE IF EXISTS `performance_performanceinventory_monthly`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceinventory_weekly
DROP TABLE IF EXISTS `performance_performanceinventory_weekly`;
CREATE TABLE IF NOT EXISTS `performance_performanceinventory_weekly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice
DROP TABLE IF EXISTS `performance_performanceservice`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`),
  KEY `service_name` (`service_name`),
  KEY `data_source` (`data_source`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_bi_hourly
DROP TABLE IF EXISTS `performance_performanceservice_bi_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_bi_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_daily
DROP TABLE IF EXISTS `performance_performanceservice_daily`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_half_hourly
DROP TABLE IF EXISTS `performance_performanceservice_half_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_half_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_hourly
DROP TABLE IF EXISTS `performance_performanceservice_hourly`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_hourly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_monthly
DROP TABLE IF EXISTS `performance_performanceservice_monthly`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_performanceservice_weekly
DROP TABLE IF EXISTS `performance_performanceservice_weekly`;
CREATE TABLE IF NOT EXISTS `performance_performanceservice_weekly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table xfusion_performance_data_node_1.performance_servicestatus
DROP TABLE IF EXISTS `performance_servicestatus`;
CREATE TABLE IF NOT EXISTS `performance_servicestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `current_value` varchar(256) DEFAULT NULL,
  `min_value` varchar(256) DEFAULT NULL,
  `max_value` varchar(256) DEFAULT NULL,
  `avg_value` varchar(256) DEFAULT NULL,
  `check_timestamp` int(11) DEFAULT NULL,
  `sys_timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sys_timestamp`),
  UNIQUE KEY `uq_device_Service_datasource` (`device_id`,`service_name`,`data_source`),
  UNIQUE KEY `unique_index` (`device_id`,`service_name`,`data_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

