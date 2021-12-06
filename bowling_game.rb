# frozen_string_literal: true

# CLASE DE BOWLING
class BowlingGame
  def initialize
    @rounds = [
      [0, 0, 0], [0, 0, 0],
      [0, 0, 0], [0, 0, 0],
      [0, 0, 0], [0, 0, 0],
      [0, 0, 0], [0, 0, 0],
      [0, 0, 0], [0, 0, 0, 0]
    ]
    @score = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @contador = 1
  end

  def draw
    (0..@contador - 2).each do |round|
      puts "\nRound #{round + 1} \n"
      (0..(@rounds[round].length - 1)).each do |num|
        print_rounds(round, num)
      end
      puts
    end
    round10
  end

  def round10
    puts "\nRound 10 \n"
    if @rounds[9][1] == 10 || @rounds[9][0] == 10
      (0..2).each do |num|
        print_rounds(9, num)
      end
    else
      (0..1).each do |num|
        print_rounds(9, num)
      end
    end
    print_rounds(9, 3)
    puts
  end

  def roll
    init = 0
    while @contador <= 9
      strikes(init)
      @contador += 1
      init += 1
    end
    round10_strike
    round10_score
    final_score
    draw
  end

  def strikes(init)
    (init..@contador).each do |round|
      score = 10
      (0..1).each do |num|
        strike = rand(0..score)
        @rounds[round][num] = strike
        score -= strike
      end
      @rounds[round][1] = 10 if @rounds[round][0] + @rounds[round][1] == 10 && @rounds[round][0] != 10
      score(round) if round != 9
    end
  end

  def round10_strike
    if @rounds[9][0] == 10
      strike = rand(0..10)
      (1..2).each do |num|
        strike = rand(0..10)
        @rounds[9][num] = strike
      end
    elsif @rounds[9][1] == 10
      strike = rand(0..10)
      @rounds[9][2] = strike
    end
  end

  def score(round)
    @score[round] = if @rounds[round][1] == 10
                      10
                    else
                      @rounds[round][0] + @rounds[round][1]
                    end
  end

  def round10_score
    if @rounds[9][1] == 10
      (1..2).each do |num|
        @score[9] += @rounds[9][num]
      end
    else
      (0..2).each do |num|
        @score[9] += @rounds[9][num]
      end
    end
  end

  def final_score
    (0..@contador - 2).each do |round|
      strike(round) if @rounds[round][0] == 10
      spare(round) if @rounds[round][1] == 10
    end
    @rounds[9][@rounds[9].length - 1] = @score[9]
    suma
  end

  def strike(round)
    @score[round] += @score[round + 1]
  end

  def spare(round)
    @score[round] += @rounds[round + 1][0]
  end

  def suma
    (0..@contador - 1).each do |round|
      @score[round] += @score[round - 1] if round >= 1
      @rounds[round][@rounds[round].length - 1] = @score[round]
    end
  end

  def hola
    print(@rounds)
    puts
    print(@score)
    puts
  end

  def print_rounds(round, num)
    puts if num == @rounds[round].length - 1
    if num.zero? && @rounds[round][num] == 10
      print('X ')
    elsif num == 1 && @rounds[round][num] == 10
      print('/ ')
    else
      print("#{@rounds[round][num]} ")
    end
  end

  def play
    roll
  end
end

game = BowlingGame.new
game.play
