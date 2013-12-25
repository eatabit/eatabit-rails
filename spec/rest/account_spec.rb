require 'spec_helper'

describe Eatabit::REST::Account do

  before do
    @account = Eatabit::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up a notifications resources object' do
    @account.should respond_to(:notifications)
    @account.notifications.instance_variable_get('@path').should == 'someUri/Notifications'
  end
end
