require "httparty"

Dir[File.dirname(__FILE__) + '/eatabit_rails/rest/*.rb'].each do |file|

  require file
end
