$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'eatabit-rails'
require 'fakeweb'
require 'rack'
require 'turn'

Dir[File.join(File.dirname(__FILE__), 'support', '*.*')].each { |f| require f }

Turn.config do |c|
 # :outline  - turn's original case/test outline mode [default]
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end

FakeWeb.allow_net_connect = true
