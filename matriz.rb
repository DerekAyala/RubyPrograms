# frozen_string_literal: true

grid = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 1, 0, 0, 0, 0],
  [0, 1, 1, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 1, 1, 1, 0],
  [0, 1, 0, 1, 0, 0, 0, 1, 0, 0],
  [1, 0, 1, 0, 1, 0, 1, 0, 0, 0],
  [0, 0, 0, 1, 1, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
  [0, 0, 1, 0, 0, 1, 1, 0, 0, 0]
]

grid2 = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

def dibujar(grid, fil, col)
  (0..fil - 1).each do |i|
    (0..col - 1).each do |j|
      if grid[i][j] == 1
        print('*')
      else
        print('.')
      end
    end
    print "\n"
  end
end

def generacion(grid, grid2, fil, col)
  (1..fil - 2).each do |i|
    (1..col - 2).each do |j|
      celulas_vivas = 0
      (-1..1).each do |a|
        (-1..1).each do |b|
          celulas_vivas += grid[i - a][j - b]
        end
      end
      celulas_vivas -= grid[i][j]
      grid2[i][j] = if grid[i][j] == 1 && celulas_vivas < 2
                      0
                    elsif grid[i][j] == 1 && celulas_vivas > 3
                      0
                    elsif grid[i][j].zero? && celulas_vivas == 3
                      1
                    else
                      grid[i][j]
                    end
    end
  end
end

puts 'Dame el numero de filas:'
fil = gets.to_i
puts 'Dame el numero de columnas:'
col = gets.to_i

if fil <= 10 && fil.positive? && col <= 10 && col.positive?
  dibujar(grid, fil, col)
  puts
  generacion(grid, grid2, fil, col)
  puts
  dibujar(grid2, fil, col)
else
  puts 'Haz ingresado valores incorrectos (solo se permiten iguales o menores a 10 y mayores a 0:) '
end
