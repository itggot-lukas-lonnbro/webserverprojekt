class Solver
  def initialize(grid)
    if grid.is_a?(Array)
      if grid.size != 9 * 9
        return "Grid treated as array, invalid grid: size is not 9 * 9"
      end

      @input_grid = grid
      map_from_array()
    elsif grid.is_a?(String()
      map_from_string())
    else
      return "Invalid grid type, expected 'Array' or 'String'"
    end

    map()
  end

  def map_from_string()
  end

  def map_from_array()
  end

  def solve()
  end
end
