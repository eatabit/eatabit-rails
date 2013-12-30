require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :fakeweb
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.after_http_request(:recordable?) do |request, response|
    puts "============> RECORDING REQUEST:\n#{request}"
    puts "============> RECORDING RESPONSE:\n#{response}"
  end
  c.after_http_request(:stubbed?) do |request, response|
    puts "============> STUBBED REQUEST:\n#{request}"
    puts "============> RECORDING RESPONSE:\n#{response}"
  end
end
