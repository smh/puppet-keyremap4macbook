require 'spec_helper'

describe 'keyremap4macbook::login_item' do
  it do
    should include_class('keyremap4macbook::config')

    should contain_exec('launch keyremap4macbook').with({
      :command     => '/usr/bin/open /Applications/KeyRemap4MacBook.app',
      :refreshonly => true,
      :subscribe   => 'Package[KeyRemap4MacBook]',
      :require     => 'Osx_login_item[KeyRemap4MacBook]'
    })
  end

  context 'with ensure defaulted' do
    it do
      should contain_osx_login_item('KeyRemap4MacBook').with({
        :ensure  => 'present',
        :path    => '/Applications/KeyRemap4MacBook.app',
        :require => 'Package[KeyRemap4MacBook]'
      })
    end
  end

  context 'with ensure set to present' do
    let(:params) do
      {
        :ensure => 'present'
      }
    end

    it do
      should contain_osx_login_item('KeyRemap4MacBook').with({
        :ensure  => 'present',
        :path    => '/Applications/KeyRemap4MacBook.app',
        :require => 'Package[KeyRemap4MacBook]'
      })
    end
  end

  context 'with ensure set to absent' do
    let(:params) do
      {
        :ensure => 'absent'
      }
    end

    it do
      should contain_osx_login_item('KeyRemap4MacBook').with({
        :ensure  => 'absent',
        :path    => '/Applications/KeyRemap4MacBook.app',
        :require => 'Package[KeyRemap4MacBook]'
      })
    end
  end
end

