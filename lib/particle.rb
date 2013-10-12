module PSO
  class Particle
    attr_accessor :position
    attr_accessor :velocity

    def initialize(position: position, velocity: velocity)
      @position, @velocity = position, velocity
    end
  end
end
