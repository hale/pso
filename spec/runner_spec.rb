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
        Particle.any_instance.should_receive(:update_local_fitness)
        runner = FactoryGirl.build(:runner)
        runner.next_step
      end
    end

  end
end
