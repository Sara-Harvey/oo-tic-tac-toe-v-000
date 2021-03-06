class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

WIN_COMBINATIONS = [
    [0,1,2],    
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  @index = input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(index)
    @board[index] != " "
  end

def valid_move?(index)
 if index.between?(0,8) && !position_taken?(index)
   return true
 else 
   return false 
end
end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

def turn_count
  occupied_positions = 0
  @board.each do |position|
    if position == "X" || position == "O"
  occupied_positions += 1
end
end
occupied_positions
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
end 
end
  false
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

 def draw?
    !won? && full? ? true : false
  end
  
def over?
    won? || draw? || full? ? true : false
  end

def winner
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return "X"
    else
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
end
end
end
return nil
end

def play
  turn until over?
    puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
  end
end