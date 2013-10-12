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
      particle = FactoryGirl.build(:particle, fitness_function: ThreeXPlusOneFunction.new)
      particle.fitness_function.class.should eq(ThreeXPlusOneFunction)
    end

    describe "#setup" do
      let(:particle) { FactoryGirl.build(:particle, fitness_function: ThreeXPlusOneFunction.new) }
      before(:each) { particle.setup }

      it "assigns current position to best position" do
        particle.best_position.should eq(particle.position)
      end

      it "assigns a velocity" do
        particle.velocity.should_not be_nil
      end
    end

    describe "#update_fitness" do
      it "changes the fitness value" do
        particle = FactoryGirl.build(:particle, fitness_function: ThreeXPlusOneFunction.new)
        expect{ particle.update_fitness }.to change{ particle.fitness }
      end
    end


  end
end
