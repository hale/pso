module PSO
  class Particle
    attr_reader :position
    attr_reader :velocity
    attr_reader :best_position

    def initialize(position: position, velocity: velocity)
      @position, @velocity = position, velocity
      @best_position = position
    end
  end
end
