require 'spec_helper'

describe Eatabit::REST::InstanceResource do
  it 'should set up an internal reference to the uri and client' do
    resource = Eatabit::REST::InstanceResource.new('some/uri', 'someClient')
    resource.instance_variable_get('@path').should == 'some/uri'
    resource.instance_variable_get('@client').should == 'someClient'
  end

  it 'should set up object properties if passed' do
    params = {'SomeKey' => 'someValue'}
    resource = Eatabit::REST::InstanceResource.new('uri', 'client', params)
    resource.some_key.should == 'someValue'
  end
end
