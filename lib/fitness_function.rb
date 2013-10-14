module PSO
  class FitnessFunction

    # Public: the result of the function under test with this input. Do not use
    # this class directly; include or inherit from it and override #fitness
    #
    # parameters - an ordered list of the variables in the fitness function.
    #
    # Returns a double representing the solution for this state.
    def fitness(parameters: parameters)
      0.0
    end

    # Public: compares two results. For example if you wish to minimise,
    # function: candidate < best
    #
    # best - the current best solution
    # candidate - the candidate solution.
    #
    # Returns true if the candidate is better than the current best, false
    # otherwise.
    def better?(best: best, candidate: candidate)
    end
  end

  class XSquaredFunction < FitnessFunction
    def fitness(parameters: parameters)
      parameters[0]**2
    end

    def better?(best: best, candidate: candidate)
      candidate < best
    end
  end
end
