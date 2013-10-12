require_relative 'spec_helper'

module PSO
  describe Runner do

    it "can be assigned a search space" do
      search_space = FactoryGirl.build(:search_space, swarm_size: 20)
      runner = FactoryGirl.build(:runner, search_space: search_space)
      runner.search_space.should eq(search_space)
    end

    describe "stepping through the simulation" do
      it "increments the step counter" do
        runner = FactoryGirl.build(:runner)
        expect { runner.next_step }.to change{ runner.step }.by(1)
      end

      xit "tells the particles to calculate the fitness of their current position" do
        particle = double('particle')
        particle.stub(fitness: 2)
        search_space = double("search space")
        search_space.stub(particle: particle)
        runner = FactoryGirl.build(:runner, search_space: search_space)
        expect { runner.next_step }.to change{ particle.fitness }
      end
    end

  end
end
