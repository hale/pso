require 'spec_helper'

FactoryGirl.define do
  factory :particle, class: PSO::Particle do
    position [0.0]
    fitness_function { build(:fitness_function) }
    initialize_with { new(attributes) }
  end

  factory :search_space, class: PSO::SearchSpace do
    swarm_size 10
    dimensions [[-1.0,1.0]]
    initialize_with { new(attributes) }
  end

  factory :runner, class: PSO::Runner do
    search_space { build(:search_space) }
    initialize_with { new(attributes) }
  end

  factory :fitness_function, class: PSO::FitnessFunction do
  end
end
