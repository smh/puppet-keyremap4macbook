# Public: call the commandline
#
# command = the command to pass to the commandline. Defaults to the title.
#
# Examples
#
#   # set the repeat.wait parameter to 30
#   keyremap4macbook::exec { 'set repeat.wait 30': }
#
#   # don't execute unless repeat.wait is already set to 30
#   keyremap4macbook::exec { 'set repeat.wait 30':
#     unless => 'repeat.wait=30'
#   }
#
#   # explicitly specify the commandline
#   keyremap4macbook::exec { 'foobar':
#     command => 'enable remap.shiftL2commandL'
#   }
define keyremap4macbook::exec($command = $title, $unless = undef, $onlyif = undef) {
  include keyremap4macbook::config

  $unless_changed = $unless ? {
    undef   => undef,
    default => "${keyremap4macbook::config::cli} changed | grep ${unless}"
  }

  $onlyif_changed = $onlyif ? {
    undef   => undef,
    default => "${keyremap4macbook::config::cli} changed | grep ${onlyif}"
  }

  exec { "keyremap4macbook::exec ${command}":
    command => "${keyremap4macbook::config::cli} ${command}",
    require => Exec["launch keyremap4macbook${keyremap4macbook::config::version}"],
    unless  => $unless_changed,
    onlyif  => $onlyif_changed
  }
}
