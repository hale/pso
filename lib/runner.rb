module PSO
  class Runner
    attr_reader :step
    attr_reader :particles
    attr_reader :best_fitness
    attr_reader :best_position

    def initialize(particles: particles)
      @step = 0
      @particles = particles
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
      c1, c2, r1, r2, w, best_position, max_velocity, min_velocity = 0, 0, 0, 0, 0, [0], 0, 0
      particles.each do |p|
        new_velocity = p.velocity.collect { |v| v * w } \
          + (p.best_position.map.with_index { |e,i| e - p.position[i] } )
            .collect { |pos| pos * c1 * r1} \
          + (best_position.map.with_index { |e,i| e - p.position[i] } )
            .collect { |pos| pos * c2 * r2}

        p.velocity = new_velocity.collect do |v|
          [ [v, max_velocity].min, min_velocity ].max
        end
      end
    end
  end
end
