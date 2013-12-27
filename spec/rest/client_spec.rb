require 'spec_helper'

describe Eatabit::REST::Client do

  it 'should not raise an error if the response body is empty' do
    FakeWeb.register_uri(:any, %r/api\.eatabit\.io/, body: '')
    client = Eatabit::REST::Client.new('id', 'key')

    Eatabit::REST::Account.new('/1', client).delete
  end

  it 'should not raise an error if the response body is nil' do
    response = double(:response, body: nil)
    connection = double(:connection, request: response)
    client = Eatabit::REST::Client.new('id', 'key')
    client.instance_variable_set(:@connection, connection)

    Eatabit::REST::Account.new('/1', client).delete
  end

  it 'should set up a new client instance with the given sid and token' do
    client = Eatabit::REST::Client.new('id', 'key')

    expect(client.account_sid).to eq('id')
    expect(client.instance_variable_get('@auth_token')).to eq('key')
  end

  it 'should set up the proper default http ssl connection' do
    client = Eatabit::REST::Client.new('id', 'key')
    connection = client.instance_variable_get('@connection')

    expect(connection.address).to eq('api.eatabit.io')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to be_true
  end

  it 'should set up the proper http ssl connection when a different domain is given' do
    client = Eatabit::REST::Client.new('id', 'key', host: 'api.fakeeatabit.io')
    connection = client.instance_variable_get('@connection')

    expect(connection.address).to eq('api.fakeeatabit.io')
    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to be_true
  end

  it 'should adjust the open and read timeouts on the underlying Net::HTTP object when asked' do
    timeout = rand(30)
    client = Eatabit::REST::Client.new('id', 'key', timeout: timeout)
    connection = client.instance_variable_get('@connection')

    expect(connection.port).to eq(443)
    expect(connection.use_ssl?).to be_true
    expect(connection.open_timeout).to eq(timeout)
    expect(connection.read_timeout).to eq(timeout)
  end

  it 'should set up an account object with the given id' do
    client = Eatabit::REST::Client.new('id', 'key')

    expect(client).to respond_to(:account)
    expect(client.account.instance_variable_get('@path')).to eq('/v1/account/id')
  end

  # it 'should convert all parameter names to Twilio-style names' do
  #   twilio = Eatabit::REST::Client.new('id', 'key')
  #   untwilified = {:sms_url => 'someUrl', 'voiceFallbackUrl' => 'anotherUrl',
  #     'Status_callback' => 'yetAnotherUrl'}
  #   twilified = {:SmsUrl => 'someUrl', :VoiceFallbackUrl => 'anotherUrl',
  #     :StatusCallback => 'yetAnotherUrl'}

  #   twilio.instance_eval do
  #     twilify(untwilified).should == twilified
  #   end
  # end
end
