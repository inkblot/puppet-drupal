# ex:ts=4 sw=4 tw=72

class drupal::params {
	case $osfamily {
		'Debian': {
			$drupal_package = 'drupal7'
			$drush_package = 'drush'
			$drupal_sites = '/etc/drupal/7/sites'
			$drupal_path = '/usr/share/drupal7'
			$db_name = 'drupal7'
			$db_user = 'drupal7'
			$db_server = 'localhost'
			$user = 'www-data'
			$group = 'www-data'
		}
		default: {
			fail("This module does not yet support ${osfamily}")
		}
	}
}
