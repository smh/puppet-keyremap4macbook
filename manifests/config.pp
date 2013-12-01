# configuration for keyremap4macbook
#
# $dmg_url - where to download the dmg
# $app - location of installed application
# $cli - location of command-line interface to the application
# $private_xml_path - location of private.xml
class keyremap4macbook::config {
  $version = '9.2.0'
  $base_url = 'https://pqrs.org/macosx/keyremap4macbook/files'
  $dmg_url = "${base_url}/KeyRemap4MacBook-${version}.dmg"
  $app = '/Applications/KeyRemap4MacBook.app'
  $cli = "${app}/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli"
  $private_xml_dir = "/Users/${::boxen_user}/Library/Application Support/KeyRemap4MacBook/"
  $private_xml_path = "/Users/${::boxen_user}/Library/Application Support/KeyRemap4MacBook/private.xml"
}
