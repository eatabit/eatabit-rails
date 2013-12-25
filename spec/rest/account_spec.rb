require 'spec_helper'

describe Twilio::REST::Account do

  before do
    @account = Twilio::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up a notifications resources object' do
    @account.should respond_to(:notifications)
    @account.notifications.instance_variable_get('@path').should == 'someUri/Notifications'
  end
end
