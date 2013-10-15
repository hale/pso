require_relative 'spec_helper'

module PSO
  describe FitnessFunction do
    it "has a method to compute the fitness, returns 0 by default" do
      FitnessFunction.new.fitness(parameters: nil).should == 0.0
    end

    it "has a method to compare values of the function" do
      FitnessFunction.new.better_fitness?(best: nil, candidate: nil).should == nil
    end
  end

  describe XSquaredFunction do
    it "#fitness gives 16 when x is 4" do
      XSquaredFunction.new.fitness(parameters: [4]).should eq(16)
    end

    it "#better? minimises the function" do
      XSquaredFunction.new.better_fitness?(best: 4, candidate: 3).should
      be_true
      XSquaredFunction.new.better_fitness?(best: 2, candidate: 2).should
      be_false
    end

    it "#best gives the smallest in the list" do
      results = [[12],[32],[2],[121]]
      XSquaredFunction.new.best_result(results: results).should eq([2])
    end
  end
end
