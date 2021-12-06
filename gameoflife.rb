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
  for i in(0..fil - 1)
    for j in (0..col - 1)
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
  for i in(1..fil - 2)
    for j in (1..col - 2)
      celulas_vivas = 0
      for a in(-1..1)
        for b in (-1..1)
          celulas_vivas += grid[i - a][j - b]
        end
      end
      celulas_vivas -= grid[i][j]
      if grid[i][j] == 1 && celulas_vivas < 2
        grid2[i][j] = 0
      elsif grid[i][j] == 1 && celulas_vivas > 3
        grid2[i][j] = 0
      elsif grid[i][j].zero? && celulas_vivas == 3
        grid2[i][j] = 1
      else
        grid2[i][j] = grid[i][j]
      end
    end
  end
end

puts "Dame el numero de filas:"
fil = gets.to_i
puts "Dame el numero de columnas:"
col = gets.to_i

if fil <= 10 && fil.positive? && col <= 10 && col.positive?
  dibujar(grid, fil, col)
  puts
  generacion(grid, grid2, fil, col)
  puts
  dibujar(grid2, fil, col)
else
  puts "Haz ingresado valores incorrectos (solo se permiten iguales o menores a 10 y mayores a 0:) "
end
