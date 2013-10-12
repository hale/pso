require 'spec_helper'

FactoryGirl.define do
  factory :particle, class: PSO::Particle do
    position [0.0]
    velocity 0.0
  end

  factory :search_space, class: PSO::SearchSpace do
    swarm_size 10
    dimensions [[-1.0,1.0]]
  end
end
