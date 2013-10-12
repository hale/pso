require_relative 'spec_helper'

module PSO
  describe FitnessFunction do
    it "has a method to compute the fitness, returns 0 by default" do
      FitnessFunction.new.fitness(parameters: nil).should == 0.0
    end
  end

  describe ThreeXPlusOneFunction do
    it "gives 10 when x is 3" do
      ThreeXPlusOneFunction.new.fitness(parameters: [3]).should eq(10)
    end
  end
end
