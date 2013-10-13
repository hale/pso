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

    it "has a velocity with the same dimensions as the position" do
      position = [1, 2, 3]
      particle = FactoryGirl.build(:particle, position: position)
      particle.velocity.should eq([0.0, 0.0, 0.0])
    end

    it "has an initial fitness value" do
      particle = FactoryGirl.build(:particle, fitness_function:
                                   ThreeXPlusOneFunction.new, position: [4])
      particle.fitness.should eq(13)
    end

    describe "#position=" do
      it "updates best_position if position > best_position" do
        particle = FactoryGirl.build(:particle, position: [[1.0]])
        particle.position = [2.0]
        particle.best_position.should eq([2.0])
      end

      it "updates position" do
      end
    end

  end
end
