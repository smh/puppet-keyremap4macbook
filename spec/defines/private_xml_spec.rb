require 'spec_helper'

describe 'keyremap4macbook::private_xml' do
  let(:title) { 'foobar' }
  let(:facts) do
    {
      :boxen_user => 'smh'
    }
  end

  it do
    should include_class('keyremap4macbook::config')
  end

  context 'with source set to whatever' do
    let(:params) do
      {
        :source => 'whatever'
      }
    end

    it do
      should contain_file('/Users/smh/Library/Application Support/KeyRemap4MacBook/private.xml').with({
        :source => 'whatever'
      })
    end
  end

  context 'with content set to whatever' do
    let(:params) do
      {
        :content => 'whatever'
      }
    end

    it do
      should contain_file('/Users/smh/Library/Application Support/KeyRemap4MacBook/private.xml').with({
        :content => 'whatever'
      })
    end
  end
end

