class Board
  
  def initialize
    @board = [[nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil]]
  end
  
  def print
    @board.each do |row|
      row_text = ''
      row.each do |column|
        mark_or_border = column ? column : '_'
        row_text += "#{mark_or_border}|"
      end
      puts row_text
    end
  end
    
  def winner
    return true if build_lines("horizontal")  
    
    return true if build_lines("vertical")
    
    line = [@board[0][0], @board[1][1], @board[2][2]]
    return true if check_winning_line(line)
    
    line = [@board[2][0], @board[1][1], @board[0][2]]
    return true if check_winning_line(line)
    
    return false
  end
  
  def make_move(move, mark)
    if move.match("top")
       column = 0
    elsif move.match("middle")
       column = 1
    elsif move.match("bottom")
       column = 2
  end  

    if move.match("left")
       row = 0
    elsif move.match("center")
      row = 1
    elsif move.match("right")
       row = 2
  end
     
    if column && row && @board[column][row] == nil
       @board[column][row] = mark
    else
      puts "Invalid move. Please try again."
      false
    end
  end
  
  private
  def check_winning_line(line)
    matchingmarks = line.select{|el| el == line.first}.compact.length
    if matchingmarks == 3
      return true
    end
  end

  def build_lines(direction)
     [0,1,2].each do |column|
      line = []
      [0,1,2].each do |row|
        if direction == "horizontal" 
          line<<@board[column][row] 
        elsif direction == "vertical"
          line<<@board[row][column]
        end 
      end
      return true if check_winning_line(line) 
     end
  end 
end