require 'spec_helper'

describe Eatabit::REST::Order do

  before { @client = Eatabit::REST::Client.new('1', '6s3AcHtv4Eja2ZkEhtPo4w') }

  describe 'instance' do

    describe 'existing order', vcr: true do

      before { @order = Eatabit::REST::Order.new('/v1/account/1/order/1', @client) }

      subject { @order }

      it 'should retreive Order data from the API' do
        expect(subject.customer_name).to eq("Hank Jones")
      end
    end

    describe 'non-existent order', vcr: true do

      before { @order = Eatabit::REST::Order.new('/v1/account/1/order/9999', @client) }

      subject { @order }

      it 'should retreive an error from the API' do
        expect { subject.try(:customer_name) }.to raise_error(Eatabit::REST::RequestError)
      end
    end
  end
end
