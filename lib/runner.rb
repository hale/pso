module PSO
  class Runner
    require 'matrix'

    attr_reader :step
    attr_reader :particles
    attr_reader :best_fitness
    attr_reader :best_position
    attr_reader :inertia_weight
    attr_reader :cognitive_weight
    attr_reader :social_weight
    attr_reader :min_velocity
    attr_reader :max_velocity
    attr_reader :search_space
    attr_reader :fitness_function

    def initialize(particles: particles, inertia_weight: inertia_weight,
                   cognitive_weight: cognitive_weight, social_weight:
                   social_weight, min_velocity: min_velocity, max_velocity:
                   max_velocity, search_space: search_space, fitness_function:
                   fitness_function)
      @step = 0
      @particles = particles
      @inertia_weight = inertia_weight
      @cognitive_weight = cognitive_weight
      @social_weight = social_weight
      @min_velocity, @max_velocity = min_velocity, max_velocity
      @search_space = search_space
      @fitness_function = fitness_function
    end

    def next_step
      @step += 1
      @particles.each(&:update_fitness)
      @best_position = fitness_function.best_input(inputs: @particles.map(&:best_position))
      @best_fitness = fitness_function.fitness(parameters: @best_position)
      @particles.each { |p| p.velocity = update_velocity(particle: p) }
      @particles.each { |p| p.position = update_position(particle: p) }
    end

    private

    def update_velocity(particle: particle)
      p = particle
      w, c1, c2 = @inertia_weight, @cognitive_weight, @social_weight
      r1, r2= rand, rand
      max_v, min_v = @max_velocity, @min_velocity

      velocity_matrix = (w * Matrix[p.velocity]) \
        + (c1 * r1 * (Matrix[p.best_position] - Matrix[p.position])) \
        + (c2 * r2 * (Matrix[@best_position] - Matrix[p.position]))

      velocity_matrix.to_a.flatten.collect.with_index do |v, i|
        [ [v, max_v[i]].min, min_v[i] ].max
      end
    end

    def update_position(particle: particle)
      upper_bounds = @search_space.upper_bounds
      lower_bounds = @search_space.lower_bounds

      position = Matrix[particle.position] + Matrix[particle.velocity]

      position.to_a.flatten.collect.with_index do |loc, i|
        [ [loc, upper_bounds[i]].min, lower_bounds[i] ].max
      end
    end
  end
end
