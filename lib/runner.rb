module PSO
  class Runner
    require 'matrix'

    attr_reader :step
    attr_reader :particles
    attr_reader :best_fitness
    attr_reader :best_position
    attr_reader :inertia_weight

    def initialize(particles: particles, inertia_weight: inertia_weight)
      @step = 0
      @particles = particles
      @inertia_weight = inertia_weight
    end

    def next_step
      @step += 1
      particles.each(&:update_fitness)
      @best_fitness = particles.max_by(&:fitness)
      @best_position = particles.max_by(&:best_position)
      update_velocity(particles)
    end

    private

    def update_velocity(particles)
      c1, c2, r1, r2, w = 1,1,1,1,1
      best_position, max_velocity, min_velocity = [1], [1], [1]
      particles.each do |p|
        v_matrix = (w * Matrix[p.velocity]) \
          + (c1 * r1 * (Matrix[p.best_position] - Matrix[p.position])) \
          + (c2 * r2 * (Matrix[best_position] - Matrix[p.position]))

        p.velocity = v_matrix.to_a.flatten.collect.with_index do |v, i|
          [ [v, max_velocity[i]].min, min_velocity[i] ].max
        end
      end
    end
  end
end
