# ex:ts=4 sw=4 tw=72

class drupal {
	include drupal::params

	class { 'drupal::install': }
}
