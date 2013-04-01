class keyremap4macbook::config {
  $dmg_url = 'http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.0.0.dmg'
  $app = '/Applications/KeyRemap4MacBook.app'
  $cli = "${app}/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli"
  $private_xml_path = "/Users/${::boxen_user}/Library/Application Support/KeyRemap4MacBook/private.xml"
}
