module Eatabit

  module REST

    class Account < InstanceResource

      def initialize(path, client, params={})
        super path, client, params

        resource :restaurants, :order, :orders
      end
    end
  end
end
