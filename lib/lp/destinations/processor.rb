module LP
  module Destinations
    class Processor
      def self.build_html(path_to_taxonomy, path_to_destinations, output_dir)
        write_css(output_dir)

        build_destinations(path_to_taxonomy, path_to_destinations).each do |destination|
          destination.write_html(output_dir)
        end
        true
      end

      def self.build_destinations(path_to_taxonomy, path_to_destinations)
        raise ArgumentError.new("#{path_to_taxonomy}: Taxonomy file not found") unless File.exists?(path_to_taxonomy)
        raise ArgumentError.new("#{path_to_destinations}: Destinations file not found") unless File.exists?(path_to_destinations)
        content = Nokogiri::XML(File.read(path_to_destinations))
        Nokogiri::XML(File.read(path_to_taxonomy)).xpath("//taxonomies/taxonomy/node").map do |node|
          build_destination(node, nil, content)
        end
      end

      class <<self
        private

        def write_css(output_dir)
          raise ArgumentError.new("#{output_dir}: Output file not found") unless File.exists?(output_dir)

          File.open(File.join(output_dir, "all.css"), File::WRONLY|File::CREAT) do |file|
            file.write LP::Destinations::CSS
          end
        end

        def build_destination(node, parent=nil, content)
          id = node.attributes["atlas_node_id"].value
          destination = Destination.new title: node.xpath("node_name").first.content, 
                                        id: id, 
                                        parent: parent

          destination.content = content.xpath("//destination[@atlas_id=#{id}]").xpath("introductory/introduction/overview").first.content.strip

          node.xpath("node").each do |child|
            destination.children << build_destination(child, destination, content)
          end

          destination
        end
      end
    end
  end
end