# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |single_win_combo|
    win_index_1 = single_win_combo[0]
    win_index_2 = single_win_combo[1]
    win_index_3 = single_win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return single_win_combo
    end
  end
  return false
end

def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif!full?(board) && !won?(board)
     return false
   else won?(board)
     return false
   end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end
# TROUBLESHOOTING: It’s important to think of position_1, position_2, position_3 as reusable and that they will cycle through all 9 spaces on the board. The elegance of comparing them to each other also got me. In draw?(board), the appearance and sequence of won?(board) and full?(board) matter.

<<<<<<< HEAD
=======
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
>>>>>>> 77ffb7a7e353366cb43fc7ae3a6ae4c6508a1ebb

def play(board)
  counter = 0
  until counter == 9
  turn(board)
  counter += 1
  end
end
<<<<<<< HEAD
=======

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
>>>>>>> 77ffb7a7e353366cb43fc7ae3a6ae4c6508a1ebb
