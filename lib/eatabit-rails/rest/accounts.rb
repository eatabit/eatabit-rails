module Eatabit

  module REST

    class Accounts < ListResource; end

    class Account < InstanceResource

      def initialize(path, client, params={})
        super path, client, params
        resource :notifications, :usage
      end
    end
  end
end
