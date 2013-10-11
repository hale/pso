module PSO
  class Particle
    attr_accessor :position
    attr_accessor :velocity

    def initialize(position: position, velocity: velocity)
      @position, @velocity = position, velocity
    end
  end

  class Runner
    attr_accessor :swarm_size
    attr_accessor :particles
    attr_accessor :search_space

    def initialize(swarm_size: swarm_size, search_space: search_space)
      @swarm_size = swarm_size
      @search_space = search_space
      @particles = []
    end

    def setup
      @swarm_size.times do
        @particles << Particle.new(position: [0.0,0.0])
      end
      self
    end
  end
end
