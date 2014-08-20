module LP
  module Destinations
    class Destination
      attr_reader :id, :title, :parent, :children
      attr_accessor :content

      def initialize(id: id, title: title, parent: nil)
        @id, @title, @parent = id, title, parent
        @children = Children.new
      end
    end
  end
end