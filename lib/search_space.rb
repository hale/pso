module PSO
  class SearchSpace
    attr_accessor :swarm_size
    attr_accessor :particles
    attr_accessor :dimensions

    def initialize(swarm_size: swarm_size, dimensions: dimensions)
      @swarm_size = swarm_size
      @dimensions = dimensions
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
      dimensions.each_with_object([]) do |dimension, position|
        position << Random.rand(dimension[0]..dimension[1])
      end
    end
  end
end
