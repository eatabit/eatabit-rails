require 'spec_helper'

describe Eatabit::REST::Restaurant do

  before { @client = Eatabit::REST::Client.new('1', '6s3AcHtv4Eja2ZkEhtPo4w') }

  describe 'instance' do

    describe 'existing restaurant', vcr: true do

      before { @restaurant = Eatabit::REST::Restaurant.new('/v1/account/1/restaurant/+15551234567', @client) }

      subject { @restaurant }

      it 'should retreive Restaurant data from the API' do
        expect(subject.name).to eq("Bill's Pizza")
      end
    end

    describe 'non-existent restaurant', vcr: true do

      before { @restaurant = Eatabit::REST::Restaurant.new('/v1/account/1/restaurant/+15550987654', @client) }

      subject { @restaurant }

      it 'should retreive an error from the API' do
        expect { subject.try(:name) }.to raise_error(Eatabit::REST::RequestError)
      end
    end
  end
end
