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

    it "has a best position found so far" do
      FactoryGirl.build(:particle).best_position.should_not be_nil
    end

  end
end
