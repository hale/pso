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
    def better_fitness?(best: best, candidate: candidate)
    end

    # Public: The best result given a list of fitness function results.
    #
    # results - return values from #fitness
    #
    # Returns the best value from the list.
    def best_result(results: results)
      best_so_far = results.sample
      results.each do |result|
        best_so_far = result if better_fitness?(best: best_so_far, candidate: result)
      end
      best_so_far
    end

    # Public: The best input given a list of inputs. I.e., the optimal solution
    # from a list of solutions.
    #
    # inputs - parameters for #fitness
    #
    # Returns the best parameters from the list of input sequences.
    def best_input(inputs: inputs)
      best_so_far = inputs.sample
      inputs.each do |input|
        if better_fitness?(best: fitness(parameters: best_so_far), candidate: fitness(parameters: input))
          best_so_far = input
        end
      end
      best_so_far
    end

  end

  class XSquaredFunction < FitnessFunction
    def fitness(parameters: parameters)
      parameters[0]**2
    end

    def better_fitness?(best: best, candidate: candidate)
      candidate < best
    end

    def best_result(results: results)
      results.min
    end

    def best_input(inputs: inputs)
      inputs.min{ |a,b| (0 - a).abs <=> (o - b).abs }
    end
  end
end
