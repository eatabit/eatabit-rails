require_relative '../../../spec_helper'

describe EatabitRails::REST::Account do

  describe "default attributes" do

    it "must include httparty methods" do
      EatabitRails::REST::Account.must_include HTTParty
    end

    it "must have the base url set to the Eatabit API endpoint" do
      EatabitRails::REST::Account.base_uri.must_equal 'https://api.eatabit.io'
    end
  end

  describe "GET account" do

    before do
      VCR.insert_cassette 'account', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "records the fixture" do
      EatabitRails::REST::Account.get('/v1/account/1')
    end
  end
end
