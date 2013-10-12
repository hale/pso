module PSO
  class SearchSpace
    attr_reader :dimensions

    def initialize(dimensions: dimensions)
      @dimensions = dimensions
    end

    def random_position
      dimensions.each_with_object([]) do |dimension, position|
        position << Random.rand(dimension[0]..dimension[1])
      end
    end
  end
end
