require 'nokogiri'

module LP
  module Destinations
    class Processor

      def self.build_destinations(path_to_taxonomy, path_to_destinations)
        raise ArgumentError.new("#{path_to_taxonomy}: File not found") unless File.exists?(path_to_taxonomy)
        raise ArgumentError.new("#{path_to_destinations}: File not found") unless File.exists?(path_to_destinations)

        Nokogiri::XML(File.read(path_to_taxonomy)).xpath("//taxonomies/taxonomy/node").map do |node|
          build_destination(node)
        end
      end

      def self.build_destination(node, parent = nil)
        destination = Destination.new title: node.xpath("node_name").first.content, 
                                      id: node.attributes["atlas_node_id"].value, 
                                      parent: parent
        
        node.xpath("node").each do |child|
          destination.children << build_destination(child, destination)
        end

        destination
      end
    end
  end
end