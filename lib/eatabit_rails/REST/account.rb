module EatabitRails

  module REST

    class Account

      include HTTParty

      base_uri 'https://api.eatabit.io'
    end
  end
end
