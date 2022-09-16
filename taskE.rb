def main()
  t = gets.to_i
  t.times do
    n, m = gets.split(' ').map(&:to_i)
    field = []
    path = ''
    n.times do
      field.push(gets.split(''))
    end
    start_row = -1
    start_column = -1
    (m + n).times do |size|
      size.times do |row|
        column = 0
        while column <= size - row
          if field[row] and field[row][column] == '*'
            start_row = row
            start_column = column
            break
          end
          column += 1
        end
        break if start_row >= 0
      end
      break if start_row >= 0
    end
    next_found, current_row, current_column, previous_row, previous_column, d = find_next(field, start_row, start_column, -1, -1)
    initial_path_row, initial_path_column = current_row, current_column
    path += d
    while next_found
      next_found, current_row, current_column, previous_row, previous_column, d = find_next(field, current_row, current_column, previous_row, previous_column)
      path += d
    end
    next_found, current_row, current_column, previous_row, previous_column, d = find_next(field, start_row, start_column, initial_path_row, initial_path_column)
    if next_found
      path = path.gsub('D', 'T').gsub('U', 'D').gsub('T', 'U')
                 .gsub('R', 'T').gsub('L', 'R').gsub('T', 'L')
                 .split('').reverse.join('')
      path += d
      while next_found
        next_found, current_row, current_column, previous_row, previous_column, d = find_next(field, current_row, current_column, previous_row, previous_column)
        path += d
      end
    end
    puts(path)
  end
end

def find_next(field, current_row, current_column, previous_row, previous_column)
  if (current_row + 1 <= field.length) and field[current_row + 1] and field[current_row + 1][current_column] == '*' and
    !(current_row + 1 == previous_row and current_column == previous_column)
    return true, current_row + 1, current_column, current_row, current_column, 'D'
  end
  if (current_column + 1 <= field[0].length) and field[current_row][current_column + 1] == '*' and
    !(current_row == previous_row and current_column + 1 == previous_column)
    return true, current_row, current_column + 1, current_row, current_column, 'R'
  end
  if (current_row - 1 >= 0) and field[current_row - 1] and field[current_row - 1][current_column] == '*' and
    !(current_row - 1 == previous_row and current_column == previous_column)
    return true, current_row - 1, current_column, current_row, current_column, 'U'
  end
  if (current_column - 1 >= 0) and field[current_row][current_column - 1] == '*' and
    !(current_row == previous_row and current_column - 1 == previous_column)
    return true, current_row, current_column - 1, current_row, current_column, 'L'
  end

  return false, -1, -1, -1, -1, ''
end

main