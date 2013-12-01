require 'spec_helper'

describe 'keyremap4macbook' do
  it do
    should include_class('keyremap4macbook::config')

    should contain_package('KeyRemap4MacBook_9.2.0').with({
      :ensure   => 'installed',
      :source   => 'https://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-9.2.0.dmg',
      :provider => 'pkgdmg'
    })
  end
end
