# ex:ts=4 sw=4 tw=72

define drupal::vhost (
	$port        = '80',
	$db_name     = $::drupal::params::db_name,
	$db_user     = $::drupal::params::db_user,
	$db_password,
	$db_server   = $::drupal::params::db_server,
	$files
) {
	$site_dir = "${drupal::params::drupal_sites}/${name}"

	file {
		$site_dir:
			ensure => directory,
			owner  => 'root',
			group  => 'root',
			mode   => '0755';

		"${site_dir}/dbconfig.php":
			ensure  => present,
			owner   => 'root',
			group   => $::drupal::params::group,
			mode    => '0640',
			content => template('drupal/dbconfig.php.erb');

		"${site_dir}/settings.php":
			ensure  => present,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			content => template('drupal/settings.php.erb');

		"${site_dir}/files":
			ensure => link,
			target => $files;

		$files:
			ensure => directory,
			owner  => $::drupal::params::user,
			group  => $::drupal::params::group,
			mode   => '0750';
	}

	apache::vhost { $name:
		port          => $port,
		docroot       => $::drupal::params::drupal_path,
		options       => '+FollowSymLinks',
		override      => 'All',
		serveraliases => $serveraliases,
	}

}
