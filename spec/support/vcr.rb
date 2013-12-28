require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :fakeweb
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.after_http_request(:recordable?) do |request|
    puts "============> RECORDING REQUEST:\n#{request}"
  end
  c.after_http_request(:stubbed?) do |request|
    puts "============> STUBBED REQUEST:\n#{request}"
  end
end
