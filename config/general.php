<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\helpers\App;

$isDev = App::env('ENVIRONMENT') === 'dev';
$isProd = App::env('ENVIRONMENT') === 'production';

return [
    // Default Week Start Day (0 = Sunday, 1 = Monday...)
    'defaultWeekStartDay' => 1,

    // Whether generated URLs should omit "index.php"
    'omitScriptNameInUrls' => true,

    // The URI segment that tells Craft to load the control panel
    'cpTrigger' => App::env('CP_TRIGGER') ?: 'admin',

    // The secure key Craft will use for hashing and encrypting data
    'securityKey' => 'lFwwEzy8P8pynM_pBjiLKBuhxA4Y-jlq',

    // Whether Dev Mode should be enabled (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => $isDev,
	'enableTemplateCaching' => false,
	'errorTemplatePrefix' => '',

    // Whether administrative changes should be allowed
    'allowAdminChanges' => true,

    // Whether crawlers should be allowed to index pages and following links
    'disallowRobots' => !$isProd,

    'maxUploadFileSize' => 158334976, // 15MiB

    'aliases' => [
        '@assets' => 'src',
		'@webroot' => dirname(__DIR__) . '/web',
    ],
];
