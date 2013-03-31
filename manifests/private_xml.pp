# Public: KeyRemap4MacBook private.xml file
#
# content - the contents of the file
# source  - the source for the file
#
# either content or source must be specified.
define keyremap4macbook::private_xml(
  $content = undef,
  $source  = undef
) {
  file { "/Users/${::boxen_user}/Library/Application Support/KeyRemap4MacBook/private.xml":
    content => $content,
    source  => $source
  }
}
