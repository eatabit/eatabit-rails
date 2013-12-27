require 'spec_helper'

describe Eatabit::REST::Account do

  before { @account = Eatabit::REST::Account.new('someUri', 'someClient') }

  it 'sets up an orders resources object' do
    expect(@account).to respond_to(:orders)
    expect(@account.orders.instance_variable_get('@path')).to eq('someUri/orders')
  end
end
