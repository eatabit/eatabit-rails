require 'net/http'
require 'net/https'
require 'builder'
require 'multi_json'
require 'cgi'
require 'openssl'
require 'base64'
require 'jwt'

require 'eatabit-rails/version' unless defined?(Eatabit::VERSION)
require 'eatabit-rails/util'
require 'eatabit-rails/configuration'
require 'eatabit-rails/util/request_validator'
require 'eatabit-rails/util/capability'
require 'eatabit-rails/rest/errors'
require 'eatabit-rails/rest/utils'
require 'eatabit-rails/rest/list_resource'
require 'eatabit-rails/rest/instance_resource'
require 'eatabit-rails/rest/account'
require 'eatabit-rails/rest/client'
require 'eatabit-rails/rest/restaurant'
require 'eatabit-rails/rest/orders'
