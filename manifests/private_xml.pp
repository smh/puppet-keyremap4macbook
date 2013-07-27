# Public: KeyRemap4MacBook private.xml file
#
# content - the contents of the file
# source  - the source for the file
#
# either content or source must be specified.
define keyremap4macbook::private_xml(
  $content = undef,
  $source  = undef,
  $ensure  = 'present'
) {
  include keyremap4macbook::config

  file { $keyremap4macbook::config::private_xml_dir:
    ensure => 'directory'
  }

  file { $keyremap4macbook::config::private_xml_path:
    ensure  => $ensure,
    content => $content,
    source  => $source,
    require => File[$keyremap4macbook::config::private_xml_dir]
  }
}
