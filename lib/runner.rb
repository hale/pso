module PSO
  class Runner
    attr_reader :step
    attr_reader :particles

    def initialize(particles: particles)
      @step = 0
      @particles = particles
    end

    def next_step
      @step += 1
      particles.each do |particle|
        particle.update_fitness
      end
    end
  end
end
