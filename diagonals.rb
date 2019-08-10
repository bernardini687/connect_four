trx = [
  %w[a b c d e f g],
  %w[h i l m n o p],
  %w[q r s t u v z],
  %w[A B C D E F G],
  %w[H I L M N O P],
  %w[Q R S T U V Z]
]

row_size = trx[0].size
min_size = 4

padding = row_size - min_size

r, c = 0, padding
diagonal1 = []

while c < row_size
  p [r, c]
  diagonal1 << trx[r][c]
  r += 1
  c += 1
end

r, c = 0, padding - 1
diagonal2 = []

while c < row_size
  p [r, c]
  diagonal2 << trx[r][c]
  r += 1
  c += 1
end

p [diagonal1, diagonal2]
p [diagonal1, diagonal2] == [%w[d n v G], %w[c m u F P]]
