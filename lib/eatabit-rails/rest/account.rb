module Eatabit

  module REST

    class Account < InstanceResource

      def initialize(path, client, params={})
        super path, client, params

        resource :restaurant, :order
      end
    end
  end
end
