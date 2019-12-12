def load_data(intcode, position)
  intcode[position]
end

def intcode_process(intcode)
  current_position = 0
  
  loop do
    case intcode[current_position]
    when 1
      value1 = load_data(intcode, intcode[current_position+1])
      value2 = load_data(intcode, intcode[current_position+2])
      intcode[intcode[current_position+3]] = value1 + value2
    when 2
      value1 = load_data(intcode, intcode[current_position+1])
      value2 = load_data(intcode, intcode[current_position+2])
      intcode[intcode[current_position+3]] = value1 * value2
    when 99
      break
    end

    current_position += 4
  end

  intcode
end

def find_pair_string(org_intcode, output)
  (0..99).each do |i|
    (0..99).each do |j|
      intcode = org_intcode.clone
      intcode[1] = i
      intcode[2] = j
      intcode_process(intcode)
      
      puts "#{i}, #{j}: #{intcode[0]}"
      if intcode[0] == output
        answer = sprintf('%02d', intcode[1]) + sprintf('%02d', intcode[2])
        return answer
      end
    end
  end
  
  raise 'could not find answer!'
end