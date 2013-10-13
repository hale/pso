require_relative 'spec_helper'

module PSO
  describe Runner do

    it "can be assigned particles" do
      particle = FactoryGirl.build(:particle, position: [20.0, 3.0])
      runner = FactoryGirl.build(:runner, particles: [particle])
      runner.particles.should eq([particle])
    end

    describe "stepping through the simulation" do

      let(:runner) { FactoryGirl.build(:constructor).runner }

      it "increments the step counter" do
        expect { runner.next_step }.to change{ runner.step }.by(1)
      end

      it "tells the particles to calculate the fitness of their current position" do
        expect { runner.next_step }.to change{ runner.particles.sample.fitness }
      end

      it "updates the best fitness with the best particle fitness" do
        expect{ runner.next_step }.to change{ runner.best_fitness }
      end

      it "updates the best position with the best particle position" do
        expect{ runner.next_step }.to change{ runner.best_position }
      end

      it "updates each particle with a new velocity" do
        expect { runner.next_step }.to change{ runner.particles.sample.velocity }
      end

      it "updates each particle with a new position" do
        expect { runner.next_step }.to change{ runner.particles.sample.position }
      end
    end
  end
end
