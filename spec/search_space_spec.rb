require_relative 'spec_helper'

module PSO
  describe SearchSpace do

    it "has dimensions" do
      search_space = FactoryGirl.build(:search_space)
      search_space.dimensions.should_not be_nil
    end

    it "has many dimensions" do
      dimensions = [[0.0,100.0], [-50.0,50.0], [230,300],[0,273.16]]
      search_space = FactoryGirl.build(:search_space, dimensions: dimensions)
      search_space.dimensions.should eq(dimensions)
    end

    describe "#random_position" do
      it "gives a coordinate within bounds" do
        dimensions = [[0.0,5.0], [-11.3,0.4]]
        search_space = FactoryGirl.build(:search_space, dimensions: dimensions)
        position = search_space.random_position

        position[0].should be > dimensions[0][0]
        position[0].should be < dimensions[0][1]
        position[1].should be > dimensions[1][0]
        position[1].should be < dimensions[1][1]
      end
    end

    it "can give the upper bounds" do
      dimensions = [[0,1], [2,3]]
      search_space = FactoryGirl.build(:search_space, dimensions: dimensions)
      search_space.upper_bounds.should eq([1,3])
    end

    it "can give the lower bounds" do
      dimensions = [[0,1], [2,3]]
      search_space = FactoryGirl.build(:search_space, dimensions: dimensions)
      search_space.lower_bounds.should eq([0,2])
    end

  end
end
