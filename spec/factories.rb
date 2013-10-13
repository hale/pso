require 'spec_helper'

FactoryGirl.define do
  factory :particle, class: PSO::Particle do
    position [0.0]
    fitness_function { build(:fitness_function) }
    initialize_with { new(attributes) }
  end

  factory :search_space, class: PSO::SearchSpace do
    dimensions [[-1.0,1.0]]
    initialize_with { new(attributes) }
  end

  factory :runner, class: PSO::Runner do
    particles { [build(:particle)] }
    inertia_weight 1.0
    cognitive_weight 1.0
    social_weight 1.0
    min_velocity [0.1]
    max_velocity [0.2]
    initialize_with { new(attributes) }
  end

  factory :fitness_function, class: PSO::FitnessFunction do
  end

  factory :constructor, class: PSO::Constructor do
    fitness_function { build(:fitness_function) }
    swarm_size 10
    dimensions [[-2.0, 2.0], [0.0, 10.0]]
    inertia_weight 1.0
    cognitive_weight 1.0
    social_weight 1.0
    min_velocity [0.1, 0.2]
    max_velocity [0.2, 0.4]
    initialize_with { new(attributes) }
  end
end
