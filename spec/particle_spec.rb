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

    it "has a fitness function" do
      particle = FactoryGirl.build(:particle, fitness_function: XSquaredFunction.new)
      particle.fitness_function.class.should eq(XSquaredFunction)
    end

    it "has a velocity with the same dimensions as the position" do
      position = [1, 2, 3]
      particle = FactoryGirl.build(:particle, position: position)
      particle.velocity.should eq([0.0, 0.0, 0.0])
    end

    it "has an initial fitness value" do
      particle = FactoryGirl.build(:particle, fitness_function:
                                   XSquaredFunction.new, position: [4])
      particle.fitness.should eq(16)
    end

    describe "#update_fitness" do
      it "updates the fitness by the current position" do
        particle = FactoryGirl.build(:particle, fitness_function:
                                     XSquaredFunction.new, position: [0.1])
        particle.position = [0.2]
        expect { particle.update_fitness }.to change{ particle.fitness }
      end

      it "sets best_fitness to fitness if fitness < best_fitness" do
        particle = FactoryGirl.build(:particle, fitness_function:
                                     XSquaredFunction.new, position: [0.3])
        particle.position = [0.1]
        expect { particle.update_fitness }.to change{ particle.best_fitness }
      end

      it "sets best_position to current position if fitness < best_fitness" do
        p = FactoryGirl.build(:particle, fitness_function:
                                     XSquaredFunction.new, position: [1])
        p.position = [0]
        expect { p.update_fitness }.to change{ p.best_position }.to([0])
      end
    end

  end
end
