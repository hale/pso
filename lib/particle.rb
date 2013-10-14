module PSO
  class Particle
    attr_accessor :position
    attr_reader :fitness
    attr_reader :fitness_function
    attr_accessor :velocity
    attr_reader :best_position
    attr_reader :best_fitness

    def initialize(position: position, fitness_function: fitness_function)
      @position, @fitness_function = position, fitness_function
      @velocity = Array.new(position.count) { 0.0 }
      @best_position = position
      @fitness = fitness_function.fitness(parameters: @position)
      @best_fitness = @fitness
    end

    def update_fitness
      @fitness = fitness_function.fitness(parameters: @position)
      if fitness_function.better?(best: @best_fitness, candidate: @fitness)
        @best_fitness = @fitness
        @best_position = @position
      end
    end

  end
end
