require 'spec_helper'

FactoryGirl.define do
  factory :particle, class: PSO::Particle do
    position [0.0, 0.0]
    velocity 0.0
  end
end
