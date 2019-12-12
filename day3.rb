Point = Struct.new(:x, :y)

def log_path(path)
  grid = {}

  position = Point.new
  position.x = 0
  position.y = 0

  current_step = 0

  traces = path.split(',')
  
  traces.each do |moving|
    case moving[0]
    when 'R'
      moving[1..-1].to_i.times do
        position.x += 1
        current_step += 1
        grid = mark(position, grid, current_step)
      end
    when 'L'
      moving[1..-1].to_i.times do
        position.x -= 1
        current_step += 1
        grid = mark(position, grid, current_step)
      end
    when 'U'
      moving[1..-1].to_i.times do
        position.y += 1
        current_step += 1
        grid = mark(position, grid, current_step)
      end
    when 'D'
      moving[1..-1].to_i.times do
        position.y -= 1
        current_step += 1
        grid = mark(position, grid, current_step)
      end
    end
  end

  grid
end

def mark(position, grid, current_step)
  grid[position_key(position)] = current_step

  grid
end

def position_key(position)
  "#{position.x}:#{position.y}"
end

def find_min_distance(path1, path2)
  grid1 = log_path(path1)
  grid2 = log_path(path2)

  cross_points = grid1.keys & grid2.keys
  distances = cross_points.map do |cross|
    point = cross.split(':')
    point[0].to_i.abs + point[1].to_i.abs
  end

  distances.min
end

def find_the_fewest_steps(path1, path2)
  grid1 = log_path(path1)
  grid2 = log_path(path2)

  cross_points = grid1.keys & grid2.keys

  steps = cross_points.map do |cross|
    grid1[cross] + grid2[cross] 
  end

  steps.min
end

