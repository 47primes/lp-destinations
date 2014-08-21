require 'spec_helper'

describe LP::Destinations::Processor do
  let(:path_to_taxonomy) { File.join(File.dirname(__FILE__), "fixtures/taxonomy.xml") }
  let(:path_to_descriptions) { File.join(File.dirname(__FILE__), "fixtures/destinations.xml") }

  describe ".build_destinations" do
    it "should fail if paths to a taxonomy and destinations files are invalid" do
      File.should_receive(:exists?).with("/path/to/taxonomy").and_return(false)
      expect { LP::Destinations::Processor.build_destinations("/path/to/taxonomy", "/path/to/destinations") }.to raise_error(ArgumentError)
    end

    it "should return an array of destination objects" do
      expect(LP::Destinations::Processor.build_destinations(path_to_taxonomy, path_to_descriptions).map(&:class).uniq).to eq([LP::Destinations::Destination])
    end
  end

  describe ".build_html" do
    it "should fail if the output directory doesn't exist" do
      File.should_receive(:exists?).with("/output/dir").and_return(false)

      expect { LP::Destinations::Processor.build_html(path_to_taxonomy, path_to_descriptions, "/output/dir") }.to raise_error(ArgumentError)
    end

    it "should write a css file to the output directory if it doesn't already exist" do
      File.should_receive(:exists?).with("/output/dir").and_return(true)
      File.should_receive(:open).with("/output/dir/all.css", File::WRONLY|File::CREAT)
      LP::Destinations::Processor.should_receive(:build_destinations).and_return([])

      expect(LP::Destinations::Processor.build_html(path_to_taxonomy, path_to_descriptions, "/output/dir")).to be_true
    end

    it "should invoke #write_html on each destination object" do
      LP::Destinations::Processor.should_receive(:build_destinations).and_return([double("LP::Destinations::Destination", write_html: nil)])
      expect(LP::Destinations::Processor.build_html(path_to_taxonomy, path_to_descriptions, ".")).to be_true
    end
  end
end