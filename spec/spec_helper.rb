$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'eatabit-rails'
require 'fakeweb'
require 'rack'

FakeWeb.allow_net_connect = false
