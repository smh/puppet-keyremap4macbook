# Public: set identifier to value
#
# identifier - the identifier to set. Defaults to title.
# value - the value to set.
#
# Examples
#
#   # set the parameter.keyoverlaidmodifier_timeout to 300
#   keyremap4macbook::remap { 'parameter.keyoverlaidmodifier_timeout':
#     value => '300'
#   }
#
#   # explicitly specify the identifier
#   keyremap4macbook::remap { 'foobar':
#     identifier => 'parameter.keyoverlaidmodifier_timeout',
#     value      => '300'
#   }
define keyremap4macbook::set(
  $value,
  $identifier = $title
) {

  keyremap4macbook::exec { "keyremap4macbook::set ${identifier} ${value}":
    command => "set ${identifier} ${value}",
    unless  => "${identifier}=${value}"
  }
}
