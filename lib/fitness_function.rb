module PSO
  class FitnessFunction

    # Public: the result of the function under test with this input. Do not use
    # this class directly; include or inherit from it and override #fitness
    #
    # parameters - an ordered list of the variables in the fitness function.
    #
    # Returns a double representing the solution for this state.
    def fitness(parameters: parameters)
    end
  end

  class ThreeXPlusOneFunction < FitnessFunction
    def fitness(parameters: parameters)
      3 * parameters[0] + 1
    end
  end
end
