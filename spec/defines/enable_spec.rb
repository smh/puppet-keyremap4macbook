require 'spec_helper'

describe 'keyremap4macbook::enable' do
  let(:title) { 'foobar' }

  it do
    should contain_keyremap4macbook__cli('keyremap4macbook::enable foobar').
      with({ :command => "enable foobar" })
  end
end
