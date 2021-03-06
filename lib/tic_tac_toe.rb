class TicTacToe
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
  
    [0,3,6],
    [1,4,7],
    [2,5,8],
  
    [0,4,8],
    [6,4,2]
    ]
  
    
    def initialize(board = nil)
      @board = board || Array.new(9," ")
    end
  
   
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
   
    def input_to_index(user_input)
      user_input.to_i - 1
    end
  
   
    def move(index, current_player)
      @board[index] = current_player
    end
  
    
    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end
  
    
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
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
      counter = 0
      @board.each do|element|
        if (element == "X") || (element == "O")
          counter += 1
        end
      end
      return counter
    end
    
    
    def current_player
      (turn_count % 2 == 0)? "X" : "O"
    end
  
   
    def won?
      
      WIN_COMBINATIONS.each do |element|
          
          win_index_1 = element[0]
          win_index_2 = element[1]
          win_index_3 = element[2]
          
    
    
          
          position_1 = @board[win_index_1] 
          position_2 = @board[win_index_2] 
          position_3 = @board[win_index_3] 
          position_array = [position_1,position_2,position_3] 
    
          
          all_O = position_array.all? do|element|
            element == "O"
          end
    
          
          all_X = position_array.all? do|element|
            element == "X"
          end
         
          if ( (position_taken?(win_index_1)) && (position_taken?(win_index_2)) && (position_taken?(win_index_3)) )
            if (all_X  || all_O)
             return element
            end
          end
          
        end 
        return false
  
    end
  
    
    
    def full?
      
      @board.each do |element|
        if (element == " ")
          return false
        end
      end
      return true
    end
  
    
    def draw?
      if ( !(won?) && full? )
        return true
      elsif ( !(won?)  && !(full?) ) 
        return false
      elsif (won?)   
        return false
      end
    end
  
    
    def over?
      
      if ( won? || draw? || full?)
        return true
      end
    end
  
    
    def winner
    if ( won? ) 
        position_array = []  
        (won?).each do |element|
          position_array << @board[element]
        end
        all_X = position_array.all? do|element|
            element == "X"
        end
        if (all_X )
          return "X"
        else
          return "O"
        end
      end
    end
  
  
    
    def play
      until over? == true 
        turn
      end
      
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == true 
        puts "Cat's Game!"
      end
    end
  
  end


