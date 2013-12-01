require 'spec_helper'

describe 'keyremap4macbook::exec' do
  let(:version) { '9.2.0' }
  cli = '/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli'

  context 'with defaults' do
    let(:title) { 'list' }

    it do
      should include_class('keyremap4macbook::config')

      should contain_exec('keyremap4macbook::exec list').with({
        :command => "#{cli} list",
        :require => "Exec[launch keyremap4macbook#{version}]"
      })
    end
  end

  context 'with command set to select 1' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'select 1'
      }
    end

    it do
      should contain_exec('keyremap4macbook::exec select 1').with({
        :command => "#{cli} select 1",
        :require => "Exec[launch keyremap4macbook#{version}]",
        :unless  => nil
      })
    end
  end

  context 'with unless set to select=1' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'select 1',
        :unless  => 'select=1'
      }
    end

    it do
      should contain_exec('keyremap4macbook::exec select 1').with({
        :command => "#{cli} select 1",
        :require => "Exec[launch keyremap4macbook#{version}]",
        :unless => "#{cli} changed | grep select=1"
      })
    end
  end

  context 'with onlyif set to select=1' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'select 1',
        :onlyif  => 'select=1'
      }
    end

    it do
      should contain_exec('keyremap4macbook::exec select 1').with({
        :command => "#{cli} select 1",
        :require => "Exec[launch keyremap4macbook#{version}]",
        :onlyif => "#{cli} changed | grep select=1"
      })
    end
  end
end
