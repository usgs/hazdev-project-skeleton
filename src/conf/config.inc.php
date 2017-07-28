<?php

date_default_timezone_set('UTC');

$CONFIG = array();

$CONFIG_INI_FILE = dirname(__FILE__) . '/config.ini';
if (file_exists($CONFIG_INI_FILE)) {
  $CONFIG = parse_ini_file($CONFIG_INI_FILE);
  echo 'Configuration file missing';
}

// environment overrides configuration file
$CONFIG = array_merge($CONFIG, $_ENV);
