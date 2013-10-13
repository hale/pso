require_relative 'spec_helper'

module PSO
  describe Constructor do
    it "has a FitnessFunction" do
      fitness_function = ThreeXPlusOneFunction.new
      constructor = FactoryGirl.build(:constructor, fitness_function: fitness_function)
      constructor.fitness_function.should eq(fitness_function)
    end

    it "has a swarm size" do
      constructor = FactoryGirl.build(:constructor, swarm_size: 7)
      constructor.swarm_size.should eq(7)
    end

    it "generates a search space" do
      dimensions = [[12.9, 22.0], [0.0, 100.1]]
      constructor = FactoryGirl.build(:constructor, dimensions: dimensions)
      constructor.search_space.dimensions.should eq(dimensions)
    end

    it "has an inertia weight (w)" do
      constructor = FactoryGirl.build(:constructor, inertia_weight: 0.7)
      constructor.inertia_weight.should eq(0.7)
    end

    it "has a cognitive weight (c1)" do
      constructor = FactoryGirl.build(:constructor, cognitive_weight: 1.4)
      constructor.cognitive_weight.should eq(1.4)
    end

    it "has a social weight :c2)" do
      constructor = FactoryGirl.build(:constructor, social_weight: 0.4)
      constructor.social_weight.should eq(0.4)
    end

    describe "#setup_particles" do
      let (:constructor) { FactoryGirl.build(:constructor) }

      it "initializes <swarm_size> particles" do
        constructor.setup_particles
        constructor.particles.sample.class.should eq(Particle)
        constructor.particles.length.should eq(constructor.swarm_size)
      end

      it "gives each particle a location" do
        constructor.setup_particles
        constructor.particles.sample.position.should_not be_nil
      end

      it "assigns each particle a location in the search space" do
        constructor.search_space.should_receive(:random_position)
          .exactly(constructor.swarm_size).times
        constructor.setup_particles
      end
    end

  end
end
