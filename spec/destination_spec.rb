require 'spec_helper'

describe LP::Destinations::Destination do
  let(:great_grandfather) { LP::Destinations::Destination.new id: 1 }
  let(:grandfather) { LP::Destinations::Destination.new id: 2, parent: great_grandfather }
  let(:father) { LP::Destinations::Destination.new id: 3, parent: grandfather }
  let(:child) { LP::Destinations::Destination.new id: 4, parent: father }

  describe "#ancestors" do
    it "should return an array of parents beginning with the first" do
      expect(child.ancestors).to eq([great_grandfather, grandfather, father])
    end
  end
  
  describe "#write_html" do
    it "should write HTML to the output directory and call #write_html on all its children" do
      File.should_receive(:open).with("/output/dir/#{great_grandfather.id}.html", File::WRONLY|File::CREAT|File::TRUNC)
      
      great_grandfather.children.each do |destination|
        destination.should_receive(:write_html)
      end

      great_grandfather.write_html("/output/dir")
    end
  end
end