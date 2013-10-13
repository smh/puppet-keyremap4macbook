# Public: call the commandline
#
# command = the command to pass to the commandline. Defaults to the title.
#
# Examples
#
#   # set the repeat.wait parameter to 30
#   keyremap4macbook::cli { 'set repeat.wait 30': }
#
#   # explicitly specify the commandline
#   keyremap4macbook::remap { 'foobar':
#     commandline => 'enable remap.shiftL2commandL'
#   }
define keyremap4macbook::cli(
  $command = $title
) {
  include keyremap4macbook::config

  exec { "keyremap4macbook::cli::${command}":
    command => "${keyremap4macbook::config::cli} ${command}",
    require => Exec['launch keyremap4macbook']
  }
}
