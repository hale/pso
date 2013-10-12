require_relative 'spec_helper'

module PSO
  describe Particle do
    it "has a position" do
      particle = FactoryGirl.build(:particle)
      particle.position.should_not be_nil
    end

    it "has a position in 6d space" do
      position = [1.0, 3.2, 4.1, 2,6, 9, 19.1]
      particle = FactoryGirl.build(:particle, position: position)
      particle.position.should eq(position)
    end

    it "has a velocity" do
      FactoryGirl.build(:particle).velocity.should_not be_nil
    end
  end

  describe Runner do
    it "has a swarm size" do
      runner = FactoryGirl.build(:runner, swarm_size: 7)
      runner.setup.swarm_size.should eq(7)
    end

    it "has a search space" do
      runner = FactoryGirl.build(:runner)
      runner.search_space.should_not be_nil
    end

    it "has a search space with many dimensions" do
      search_space = [[0.0,100.0], [-50.0,50.0], [230,300],[0,273.16]]
      runner = FactoryGirl.build(:runner, search_space: search_space)
      runner.search_space.should eq(search_space)
    end

    describe "#setup" do
      it "initializes <swarm_size> particles" do
        runner = FactoryGirl.build(:runner).setup
        runner.particles.sample.class.should eq(Particle)
        runner.particles.length.should eq(runner.swarm_size)
      end

      it "gives each particle a location" do
        runner = FactoryGirl.build(:runner).setup
        runner.particles.sample.position.should_not be_nil
      end

      it "assigns each particle a location in the search space" do
        search_space = [[0.0,5.0], [-11.3,0.4]]
        runner = FactoryGirl.build(:runner, :search_space => search_space).setup
        position = runner.particles.sample.position

        position[0].should be > search_space[0][0]
        position[0].should be < search_space[0][1]
        position[1].should be > search_space[1][0]
        position[1].should be < search_space[1][1]
      end
    end
  end
end
