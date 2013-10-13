module PSO
  class Constructor
    attr_reader :fitness_function
    attr_reader :swarm_size
    attr_reader :search_space
    attr_reader :particles
    attr_reader :inertia_weight
    attr_reader :cognitive_weight

    def initialize(fitness_function: fitness_function, swarm_size: swarm_size,
                   dimensions: dimensions, inertia_weight: inertia_weight,
                   cognitive_weight: cognitive_weight)
      @fitness_function = fitness_function
      @swarm_size = swarm_size
      @search_space = SearchSpace.new(dimensions: dimensions)
      @particles = setup_particles
      @inertia_weight = inertia_weight
      @cognitive_weight = cognitive_weight
    end

    def setup_particles
      [].tap do |particles|
        @swarm_size.times do
          particles << setup_particle
        end
      end
    end

    private

    def setup_particle
      Particle.new(position: search_space.random_position,
                   fitness_function: @fitness_function)
    end
  end
end
