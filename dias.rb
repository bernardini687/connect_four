trx = [
  %w[a b c d e f g],
  %w[h i l m n o p],
  %w[q r s t u v z],
  %w[A B C D E F G],
  %w[H I L M N O P],
  %w[Q R S T U V Z]
]

def sawt_diagonal(matrix, row: 0, col: 0)
  max_row = matrix.size
  max_col = matrix[0].size

  diagonal = []

  while row < max_row && col < max_col
    diagonal << matrix[row][col]
    row += 1
    col += 1
  end

  diagonal
end

# p sawt_diagonal(trx, col: 6)
# p sawt_diagonal(trx, col: 5)
# p sawt_diagonal(trx, col: 4)
p sawt_diagonal(trx, col: 3)
p sawt_diagonal(trx, col: 2)
p sawt_diagonal(trx, col: 1)
p sawt_diagonal(trx)
puts
p sawt_diagonal(trx, row: 1)
p sawt_diagonal(trx, row: 2)
# p sawt_diagonal(trx, row: 3)
# p sawt_diagonal(trx, row: 4)
# p sawt_diagonal(trx, row: 5)
puts

def ramp_diagonal(matrix, row: 0, col: 0)
  max_row = matrix.size
  max_col = matrix[0].size

  diagonal = []

  while col >= 0 && row < max_row
    diagonal << matrix[row][col]
    row += 1
    col -= 1
  end

  diagonal
end

# p ramp_diagonal(trx)
# p ramp_diagonal(trx, col: 1)
# p ramp_diagonal(trx, col: 2)
p ramp_diagonal(trx, col: 3)
p ramp_diagonal(trx, col: 4)
p ramp_diagonal(trx, col: 5)
p ramp_diagonal(trx, col: 6)
puts
p ramp_diagonal(trx, row: 1, col: 6)
p ramp_diagonal(trx, row: 2, col: 6)
# p ramp_diagonal(trx, row: 3, col: 6)
# p ramp_diagonal(trx, row: 4, col: 6)
# p ramp_diagonal(trx, row: 5, col: 6)
