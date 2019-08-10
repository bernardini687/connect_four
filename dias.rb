trx = [
  %w[a b c d e f g],
  %w[h i l m n o p],
  %w[q r s t u v z],
  %w[A B C D E F G],
  %w[H I L M N O P],
  %w[Q R S T U V Z]
]

# [0,0]
# [0,1], [1,0]
# [0,2], [1,1], [2,0]
# [0,3], [1,2], [2,1], [3,0]
# [0,4], [1,3], [2,2], [3,1], [4, 0]
# [0,5], [1,4], [2,3], [3,2], [4, 1], [5,0]
# [0,6], [1,5], [2,4], [3,3], [4, 2], [5, 1]

# [1,6], [2,5], [3,4], [4,3], [5,2]
# [2,6], [3,5], [4,4], [5,3]
# [3,6], [4,5]. [5,4]
# [4,6], [5,5]
# [5,6]

# max_col = 7 = row.size
# max_row = 6 = trx.size

# [r,c]
# [r + 1, c - 1] until r is max_row or c is 0

def diagonal_from(matrix, row: 0, col: 0)
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

# p diagonal_from(trx)
# p diagonal_from(trx, col: 1)
# p diagonal_from(trx, col: 2)
p diagonal_from(trx, col: 3)
p diagonal_from(trx, col: 4)
p diagonal_from(trx, col: 5)
p diagonal_from(trx, col: 6)
puts
p diagonal_from(trx, row: 1, col: 6)
p diagonal_from(trx, row: 2, col: 6)
# p diagonal_from(trx, row: 3, col: 6)
# p diagonal_from(trx, row: 4, col: 6)
# p diagonal_from(trx, row: 5, col: 6)
