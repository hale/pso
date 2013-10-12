module PSO
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
        @particles << Particle.new(position: random_position)
      end
      self
    end

    private

    def random_position
      search_space.each_with_object([]) do |dimension, position|
        position << Random.rand(dimension[0]..dimension[1])
      end
    end
  end
end
