module PSO
  class Particle
    attr_reader :position
    attr_reader :fitness
    attr_reader :fitness_function
    attr_accessor :velocity
    attr_reader :best_position

    def initialize(position: position, fitness_function: fitness_function)
      @position, @fitness_function = position, fitness_function
      @velocity = [0.0]
      @best_position = position
    end

    def update_fitness
      @fitness = fitness_function.fitness(parameters: position)
    end
  end
end
