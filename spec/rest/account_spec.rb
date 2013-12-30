require 'spec_helper'

describe Eatabit::REST::Account do

  before { @client = Eatabit::REST::Client.new('1', '6s3AcHtv4Eja2ZkEhtPo4w') }

  describe 'resources' do

    before { @account = Eatabit::REST::Account.new('someUri', 'someClient') }

    it 'sets up an orders resources object' do
      expect(@account).to respond_to(:orders)
      expect(@account.orders.instance_variable_get('@path')).to eq('someUri/orders')
    end

    it 'sets up a restaurant resource object' do
      expect(@account).to respond_to(:restaurant)
      expect(@account.restaurant.instance_variable_get('@path')).to eq('someUri/restaurant')
    end
  end

  describe 'instance' do

    describe 'existing account', vcr: true do

      before { @account = Eatabit::REST::Account.new('/v1/account/1', @client) }

      subject { @account }

      it 'should retreive Account data from the API' do
        expect(subject.name).to eq('eatabit.io')
      end
    end

    describe 'non-existent account', vcr: true do

      before { @account = Eatabit::REST::Account.new('/v1/account/9999', @client) }

      subject { @account }

      it 'should retreive an error from the API' do
        expect { subject.try(:name) }.to raise_error(Eatabit::REST::RequestError)
      end
    end
  end
end
