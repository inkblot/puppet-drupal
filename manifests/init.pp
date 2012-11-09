# ex:ts=4 sw=4 tw=72

class drupal (
	$db_root_password,
) {
	include drupal::params

	class { 'drupal::install': }
}
