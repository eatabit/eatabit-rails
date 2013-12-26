require 'spec_helper'

describe Eatabit::REST::Account do

  before do
    @account = Eatabit::REST::Account.new('someUri', 'someClient')
  end

  it 'sets up a notifications resources object' do
    expect(@account).to respond_to(:notifications)
    expect(@account.notifications.instance_variable_get('@path')).to eq('someUri/Notifications')
  end
end
