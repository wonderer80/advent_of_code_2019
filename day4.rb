def next_criteria(position, criteria)
  str = criteria.to_s

  if position == -1
    str.insert(0, '0')
    position = 0
  end

  current_number = str[position].to_i

  if current_number < 9
    current_number += 1
    (position...str.size).each do |i|
      str[i] = current_number.to_s
    end
  else
    position -= 1
    str = next_criteria(position, criteria)
  end

  str
end

def find_next_criteria(criteria)
  normalized_criteria = normalize_criteria(criteria)

  return normalized_criteria if  normalized_criteria != criteria

  criteria_str = criteria.to_s
  position = criteria_str.size - 1

  next_criteria(position, criteria).to_i
end

def normalize_criteria(criteria)
  criteria_str = criteria.to_s

  (0...criteria_str.size).each do |i|
    number = criteria_str[i].to_i
    next_number = criteria_str[i+1].to_i

    if number > next_number
      (i...criteria_str.size).each do |j|
        criteria_str[j] = number.to_s
      end

      break
    end
  end

  criteria_str.to_i
end

def count_criteria(min, max)
  count = 0
  current_criteria = min

  loop do
    current_criteria = find_next_criteria(current_criteria)

    break if current_criteria >= max

    count += 1 if include_adjacent_digits?(current_criteria)
  end

  count
end

def include_adjacent_digits?(number)
  number_str = number.to_s

  return false if number_str.size < 2

  position = 0

  loop do
    number = number_str[position].to_i
    next_number = number_str[position+1].to_i

    return true if number == next_number

    position += 1

    break if position == number_str.size
  end

  false
end

def include_adjacent_digits2?(number)
  number_str = number.to_s

  return false if number_str.size < 2

  position = 0


  temp_number = nil
  duplicated_count = 0

  loop do
    number = number_str[position].to_i
    if temp_number == number
      duplicated_count += 1
    else
      return true if duplicated_count == 1

      duplicated_count = 0
    end

    temp_number = number
    position += 1

    break if position == number_str.size
  end

  duplicated_count == 1
end

