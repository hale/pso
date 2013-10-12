module PSO
  class Runner
    attr_reader :step
    attr_reader :search_space
    attr_reader :best_position

    def initialize(search_space: search_space)
      @step = 1
      @search_space = search_space
    end

    def next_step
      @step += 1
      search_space.particles.each do |particle|
        particle.update_local_fitness
      end
    end
  end
end
