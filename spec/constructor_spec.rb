require_relative 'spec_helper'

module PSO
  describe Constructor do
    it "generates a search space" do
      dimensions = [[12.9, 22.0], [0.0, 100.1]]
      constructor = FactoryGirl.build(:constructor, dimensions: dimensions)
      constructor.search_space.dimensions.should eq(dimensions)
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

      it "gives each particle a fitness function" do
        constructor.setup_particles
        constructor.particles.sample.fitness_function.should_not be_nil
      end

      it "assigns each particle a location in the search space" do
        constructor.search_space.should_receive(:random_position)
          .exactly(constructor.swarm_size).times
        constructor.setup_particles
      end
    end

    describe "#setup_runner" do
      it "assigns particles" do
        constructor = FactoryGirl.build(:constructor, swarm_size: 12)
        constructor.setup_runner
        constructor.runner.particles.count.should eq(12)
      end

      it "assigns the inertia weight" do
        constructor = FactoryGirl.build(:constructor, inertia_weight: 0.3)
        constructor.setup_runner
        constructor.runner.inertia_weight.should eq(0.3)
      end

      it "assigns the cognitive weight" do
        constructor = FactoryGirl.build(:constructor, cognitive_weight: 1.2)
        constructor.setup_runner
        constructor.runner.cognitive_weight.should eq(1.2)
      end

      it "assigns the social weight" do
        constructor = FactoryGirl.build(:constructor, social_weight: 9.2)
        constructor.setup_runner
        constructor.runner.social_weight.should eq(9.2)
      end

      it "assigns the minimum allowable velocity" do
        constructor = FactoryGirl.build(:constructor, dimensions: [[0.0, 1.0]],
                                        min_velocity: [0.1])
        constructor.setup_runner
        constructor.runner.min_velocity.should eq([0.1])
      end

      it "assigns the maximum allowable velocity" do
        constructor = FactoryGirl.build(:constructor, dimensions: [[0.0,1.0]],
                                        max_velocity: [0.3])
        constructor.setup_runner
        constructor.runner.max_velocity.should eq([0.3])
      end

    end
  end
end
