# ex:ts=4 sw=4 tw=72

class drupal::params {
	case $osfamily {
		'Debian': {
			$drupal_package = 'drupal7'
			$drush_package = 'drush'
		}
		default: {
			fail("This module does not yet support ${osfamily}")
		}
	}
}
