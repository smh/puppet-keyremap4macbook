require 'spec_helper'

describe 'keyremap4macbook::set' do
  let(:title) { 'foobar' }
  let(:params) do
    { :value => 'xyz' }
  end

  it do
    should contain_keyremap4macbook__exec('keyremap4macbook::set foobar xyz').with({
      :command => "set foobar xyz", :unless => "foobar=xyz"
    })
  end

  context 'with identifier set to barfoo and value set to zyx' do
    let(:params) do
      { :identifier => 'barfoo', :value => 'zyx' }
    end

    it do
      should contain_keyremap4macbook__exec('keyremap4macbook::set barfoo zyx').with({
        :command => "set barfoo zyx", :unless => "barfoo=zyx"
      })
    end
  end
end
