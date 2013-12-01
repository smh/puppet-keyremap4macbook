# Public: enable identifier
#
# identifier - the identifier to enable. Defaults to title.
#
# Examples
#
#   # don't remap external keyboards
#   keyremap4macbook::enable { 'general.dont_remap_external': }
#
#   # explicitly specify the identifier
#   keyremap4macbook::enable { 'use dvorak, make your hands happy':
#     identifier => 'remap.qwerty2dvorak'
#   }
define keyremap4macbook::enable($identifier = $title)
{
  keyremap4macbook::exec { "keyremap4macbook::enable ${identifier}":
    command => "enable ${identifier}",
    unless  => "${identifier}=1"
  }
}
