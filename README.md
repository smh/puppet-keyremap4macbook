# KeyRemap4MacBook Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-keyremap4macbook.png?branch=master)](https://travis-ci.org/boxen/puppet-keyremap4macbook)

Installs [KeyRemap4MacBook](http://pqrs.org/macosx/keyremap4macbook/index.html.en) on your Mac.

## Usage

```puppet
include keyremap4macbook

# launch and add login-item
include keyremap4macbook::login_item

# enable remapping left control to left control + escape
keyremap4macbook::remap{ 'controlL2controlL_escape': }

# set the parameter.keyoverlaidmodifier_timeout to 300
keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
  value => '300'
}

# set the contents of the private.xml file.
keyremap4macbook::private_xml{ 'private.xml':
  content => '<some>xml</some>'
}
```

## Required Puppet Modules

* `boxen`
* `osx`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
