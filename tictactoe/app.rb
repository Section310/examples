require "./lib/player"
require "./lib/board"

players = [Player.new("x"),Player.new("o")]
board = Board.new

def game_loop(move,move_number,players,board)
  player = if move_number.even?
    players[0]
  else
    players[1]
  end
  board.print
  puts "enter your move player #{player.mark}"
  move = gets.chomp
  if move != "q"
    result = board.make_move(move, player.mark)
    unless result == false
      move_number += 1 
      if board.winner
        puts "Winner!"
        board.print 
        break
      end 
    end
  end 
  
move = nil
move_number = 0
while(move != 'q' && move_number < 9)
  game_loop(move,move_number,players,board)
  
end 
puts "game over!"