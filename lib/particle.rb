module PSO
  class Particle
    attr_reader :position
    attr_reader :fitness
    attr_reader :fitness_function

    def initialize(position: position, fitness_function: fitness_function)
      @position, @fitness_function = position, fitness_function
    end

    def update_fitness
      @fitness = fitness_function.fitness(parameters: position)
    end
  end
end
