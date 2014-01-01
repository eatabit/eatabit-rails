require 'spec_helper'

describe Eatabit::REST::Account do

  before { @client = Eatabit::REST::Client.new('1', '6s3AcHtv4Eja2ZkEhtPo4w') }

  describe 'resources' do

    before { @account = Eatabit::REST::Account.new('someUri', 'someClient') }

    it 'sets up a Restaurant resource object' do
      expect(@account).to respond_to(:restaurant)
      expect(@account.restaurant.instance_variable_get('@path')).to eq('someUri/restaurant')
    end

    it 'sets up a Restaurants resource object' do
      expect(@account).to respond_to(:restaurants)
      expect(@account.restaurants.instance_variable_get('@path')).to eq('someUri/restaurants')
    end

    it 'sets up an Order resource object' do
      expect(@account).to respond_to(:order)
      expect(@account.order.instance_variable_get('@path')).to eq('someUri/order')
    end

    it 'sets up an Orders resource object' do
      expect(@account).to respond_to(:orders)
      expect(@account.orders.instance_variable_get('@path')).to eq('someUri/orders')
    end
  end

  describe 'instance' do

    describe 'existing account', vcr: true do

      before { @account = Eatabit::REST::Account.new('/v1/account/1', @client) }

      subject { @account }

      it 'should retreive Account' do
        expect(subject.name).to eq('eatabit.io')
      end
    end

    describe 'incorrect account in route param', vcr: true do

      before { @account = Eatabit::REST::Account.new('/v1/account/9999', @client) }

      subject { @account }

      it 'should retreive authenticated Account ' do
        expect(subject.name).to eq('eatabit.io')
      end
    end
  end
end
