module Eatabit

  class Configuration

    attr_accessor :account_id,
                  :development_key,
                  :production_key

    def initialize
      @account_id = ''
      @development_key = ''
      @production_key = ''
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield configuration
  end
end
