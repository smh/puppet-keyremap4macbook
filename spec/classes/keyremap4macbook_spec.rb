require 'spec_helper'

describe 'keyremap4macbook' do
  it do
    should contain_package('KeyRemap4MacBook').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })
  end
end
