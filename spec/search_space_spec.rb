require_relative 'spec_helper'

module PSO
  describe SearchSpace do
    it "has a swarm size" do
      search_space = FactoryGirl.build(:search_space, swarm_size: 7)
      search_space.setup.swarm_size.should eq(7)
    end

    it "has a search space" do
      search_space = FactoryGirl.build(:search_space)
      search_space.dimensions.should_not be_nil
    end

    it "has a search space with many dimensions" do
      dimensions = [[0.0,100.0], [-50.0,50.0], [230,300],[0,273.16]]
      search_space = FactoryGirl.build(:search_space, dimensions: dimensions)
      search_space.dimensions.should eq(dimensions)
    end

    describe "#setup" do
      it "initializes <swarm_size> particles" do
        search_space = FactoryGirl.build(:search_space).setup
        search_space.particles.sample.class.should eq(Particle)
        search_space.particles.length.should eq(search_space.swarm_size)
      end

      it "gives each particle a location" do
        search_space = FactoryGirl.build(:search_space).setup
        search_space.particles.sample.position.should_not be_nil
      end

      it "assigns each particle a location in the search space" do
        dimensions = [[0.0,5.0], [-11.3,0.4]]
        search_space = FactoryGirl.build(:search_space, :dimensions => dimensions).setup
        position = search_space.particles.sample.position

        position[0].should be > dimensions[0][0]
        position[0].should be < dimensions[0][1]
        position[1].should be > dimensions[1][0]
        position[1].should be < dimensions[1][1]
      end
    end

  end
end
