require_relative 'spec_helper'

module PSO
  describe Runner do

    it "can be assigned particles" do
      particle = FactoryGirl.build(:particle, position: [20.0, 3.0])
      runner = FactoryGirl.build(:runner, particles: [particle])
      runner.particles.should eq([particle])
    end

    describe "stepping through the simulation" do
      it "increments the step counter" do
        runner = FactoryGirl.build(:runner)
        expect { runner.next_step }.to change{ runner.step }.by(1)
      end

      it "tells the particles to calculate the fitness of their current position" do
        particle = double("particle")
        particle.should_receive(:update_fitness)
        runner = FactoryGirl.build(:runner, particles: [particle])
        runner.next_step
      end
    end

  end
end
