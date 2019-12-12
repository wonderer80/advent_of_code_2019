def calc_fuel(mass)
  mass/3-2
end

def recursive_calc_fuel(mass)
  fuel = calc_fuel(mass)

  return 0 if fuel < 0
  fuel + recursive_calc_fuel(fuel)
end

def no_recursive_calc_fuel(mass)
  total_fuel = 0
  loop do
    fuel = calc_fuel(mass)
    break if fuel <= 0

    total_fuel += fuel
    mass = fuel
  end

  total_fuel
end

def total_fuel
  total_fuel = 0
  File.open('day1_input.txt').readlines.each do |line|
    total_fuel += calc_fuel(line.to_i)
  end

  total_fuel
end

def total_fuel
  total_fuel = 0
  File.open('day1_input.txt').readlines.each do |line|
    total_fuel += recursive_calc_fuel(line.to_i)
  end

  total_fuel
end
