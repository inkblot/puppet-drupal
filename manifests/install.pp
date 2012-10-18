# ex:ts=4 sw=4 tw=72

class drupal::install () {
	package { [ $drupal::params::drupal_package, $drupal::params::drush_package ]:
		ensure => latest,
	}
}
