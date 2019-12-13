Instruction = Struct.new(:opcode, :first_parameter_mode, :second_parameter_mode, :third_parameter_mode)

def load_data(intcode, position, mode = 0)
  case mode
  when 0
    intcode[intcode[position]]
  when 1
    intcode[position]
  end
end

def intcode_process(intcode, input)
  current_position = 0

  loop do
    instruction = create_instruction(intcode[current_position])

    case instruction.opcode
    when 1
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      intcode[intcode[current_position+3]] = value1 + value2
      current_position += 4
    when 2
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      intcode[intcode[current_position+3]] = value1 * value2
      current_position += 4
    when 3
      intcode[intcode[current_position+1]] = input
      current_position += 2
    when 4
      puts load_data(intcode, current_position+1, instruction.first_parameter_mode)
      current_position += 2
    when 5 # jump-if-true
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      unless value1.zero?
        current_position = value2
      else
        current_position += 3
      end
    when 6 # jump-if-false
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      if value1.zero?
        current_position = value2
      else
        current_position += 3
      end
    when 7
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      intcode[intcode[current_position+3]] = value1 < value2 ? 1 : 0
      current_position += 4
    when 8
      value1 = load_data(intcode, current_position+1, instruction.first_parameter_mode)
      value2 = load_data(intcode, current_position+2, instruction.second_parameter_mode)

      intcode[intcode[current_position+3]] = value1 == value2 ? 1 : 0
      current_position += 4
    when 99
      break
    end
  end

  intcode
end

def create_instruction(instruction_code)
  result = Instruction.new

  instruction_str = sprintf('%05d', instruction_code)
  result.opcode = instruction_str[-2..-1].to_i
  result.first_parameter_mode = instruction_str[-3].to_i
  result.second_parameter_mode = instruction_str[-4].to_i
  result.third_parameter_mode = instruction_str[-5].to_i

  result
end

