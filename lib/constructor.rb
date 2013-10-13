module PSO
  class Constructor
    attr_reader :fitness_function
    attr_reader :swarm_size
    attr_reader :search_space
    attr_reader :particles
    attr_reader :inertia_weight
    attr_reader :cognitive_weight
    attr_reader :social_weight
    attr_reader :runner
    attr_reader :min_velocity
    attr_reader :max_velocity

    def initialize(fitness_function: fitness_function, swarm_size: swarm_size,
                   dimensions: dimensions, inertia_weight: inertia_weight,
                   cognitive_weight: cognitive_weight, social_weight:
                   social_weight, min_velocity: min_velocity, max_velocity:
                   max_velocity)
      @fitness_function = fitness_function
      @swarm_size = swarm_size
      @search_space = SearchSpace.new(dimensions: dimensions)
      @particles = setup_particles
      @inertia_weight = inertia_weight
      @cognitive_weight = cognitive_weight
      @social_weight = social_weight
      @min_velocity, @max_velocity = min_velocity, max_velocity
      @runner = setup_runner
    end

    def setup_particles
      [].tap do |particles|
        @swarm_size.times do
          particles << Particle.new(position: @search_space.random_position,
                                    fitness_function: @fitness_function)
        end
      end
    end

    def setup_runner
      Runner.new(particles: @particles, inertia_weight: @inertia_weight,
                 cognitive_weight: @cognitive_weight, social_weight:
                 @social_weight, min_velocity: @min_velocity, max_velocity:
                 @max_velocity, search_space: @search_space)
    end
  end
end
