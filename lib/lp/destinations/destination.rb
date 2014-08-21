module LP
  module Destinations
    class Destination
      attr_reader :id, :title, :parent, :children
      attr_accessor :content

      def initialize(id: id, title: title, parent: nil)
        @id, @title, @parent = id, title, parent
        @children = Children.new
      end

      def ancestors
        ancestors = []
        p = self.parent
        while p
          ancestors.unshift(p)
          p = p.parent
        end
        ancestors
      end

      def write_html(output_dir)
        File.open(File.join(output_dir, "#{self.id}.html"), File::WRONLY|File::CREAT|File::TRUNC) do |file|
          template = ERB.new(LP::Destinations::TEMPLATE)
          file.write template.result(binding)
        end
        self.children.each do |child|
          child.write_html(output_dir)
        end
      end
    end
  end
end