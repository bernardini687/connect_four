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

def ramp_diagonal(matrix, row: 0, col: 0)
  max_row = matrix.size

  diagonal = []

  while col >= 0 && row < max_row
    diagonal << matrix[row][col]
    row += 1
    col -= 1
  end

  diagonal
end

def diagonals(trx)
  result = []

  0.upto(3) do |n|
    result << sawt_diagonal(trx, col: n)
    result << ramp_diagonal(trx, col: n + 3)
  end

  1.upto(2) do |n|
    result << sawt_diagonal(trx, row: n)
    result << ramp_diagonal(trx, row: n, col: 6)
  end

  result
end
