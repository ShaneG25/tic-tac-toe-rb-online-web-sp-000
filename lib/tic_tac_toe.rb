WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def display_board(board) 
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(num)
  num = num.to_i - 1
end

def move(board, index, player_token)
  player_token = "X"
  board[index] = player_token
  end

def position_taken?(board, index)
  return board[index] !=" "
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  end
end

def turn_count(board)
  counter = 0 
  
  board.each do |z| if z == "X"||z == "O"
  counter += 1 
    end 
  
  end
  return counter 
end 

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
else
  return "O"
  end 
end 

def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  else
    return false
  end 
end 

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true 
  else
    return false 
  end
end 

def winner(board)
  index = []
  index = won?(board)
  if index == false 
    return nil 
  else 
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end 
  end 
end 

def play(board)
    until over?(board)
        turn(board)
    end

    if winner(board) == nil
        puts "Cat's Game!"
    else
        puts "Congratulations #{winner(board)}!"
    end
end



