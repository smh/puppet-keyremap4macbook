require 'spec_helper'

describe 'keyremap4macbook' do
  let(:version) { '9.2.0' }

  it do
    should include_class('keyremap4macbook::config')

    should contain_package("KeyRemap4MacBook_#{version}").with({
      :ensure   => 'installed',
      :source   => "https://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-#{version}.dmg",
      :provider => 'pkgdmg'
    })
  end
end
