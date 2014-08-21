module LP
  module Destinations
    class Destination
      class Children < Array
        VALID_TYPE = Destination
        def push(object)
          raise ArgumentError.new("Only objects of type #{VALID_TYPE} are permitted") unless object.is_a?(VALID_TYPE)
          super
        end
        alias_method :<<, :push
      end
    end
  end
end