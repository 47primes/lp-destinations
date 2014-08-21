require 'spec_helper'

describe LP::Destinations::Destination::Children do
  let(:children) { LP::Destinations::Destination::Children.new }
  let(:destination) { LP::Destinations::Destination.new }

  describe "#push" do
    it "should add a destination object to self" do
      expect(children).to eq([])

      children.push(destination)

      expect(children).to eq([destination])
    end

    it "should only permit destination objects to be added" do
      expect { children.push(Object.new) }.to raise_error(ArgumentError, "Only objects of type LP::Destinations::Destination are permitted")
    end
  end

  describe "#<<" do
    it "should add a destination object to self" do
      expect(children).to eq([])

      children << destination

      expect(children).to eq([destination])
    end

    it "should only permit destination objects to be added" do
      expect { children << Object.new }.to raise_error(ArgumentError, "Only objects of type LP::Destinations::Destination are permitted")
    end
  end  
end