
class Player

    def initialize(sym, name)
        @sym = sym
        @name = name
    end

    def play(board)

        end_turn = false  

        while end_turn == false
            puts "#{@name}, from 1-3 type which space you want #{@sym}to appear on the x-axis"
            py = gets.chomp.to_i
            puts "Now type from 1-3 which space you want #{@sym}to appear on the y-axis"
            px = gets.chomp.to_i

            if px > 3 || px < 1 || py > 3 || px < 1 || board[px - 1][py - 1] != '_ '
                puts "Invalid position. Try again!"
            elsif px >= 1 && px <= 3 && py >= 1 && py <= 3
                board[px - 1][py - 1] = @sym
                end_turn = true
            end

            board.each { |x| puts x.join(" ") }
        end    
    end
end

def win_check(board)

    board.each do |x| #Checks horizontal win
        if x.all? { |y| y == "X " }  
            puts "Player 1 wins with a horizontal line!"
            return true
        elsif x.all? { |y| y == "O " }
            puts "Player 2 wins with a horizontal line!"
            return true
        end
    end

    if board.all? { |x| x[0] == "X "} || #Checks vertical win
        board.all? { |x| x[1] == "X " } ||
        board.all? { |x| x[2] == "X " }
        puts "Player 1 wins with a vertical line!"
        return true
    elsif board.all? { |x| x[0] == "O "} || #Checks vertical win
        board.all? { |x| x[1] == "O " } ||
        board.all? { |x| x[2] == "O " }
        puts "Player 2 wins with a vertical line!"
        return true
    end

   if board[0][0] == "X " && board[1][1] == "X " && board[2][2] == "X " #Checks diagonal win
        puts "Player 1 wins with the left-to-right diagonal line!"
        return true
   elsif board[0][2] == "X " && board[1][1] == "X " && board[2][0] == "X "
        puts "Player 1 wins with the right-to-left diagonal line!"
        return true
   elsif board[0][0] == "O " && board[1][1] == "O " && board[2][2] == "O "
        puts "Player 2 wins with the left-to-right diagonal line!"
        return true
   elsif board[0][2] == "O " && board[1][1] == "O " && board[2][0] == "O "
        puts "Player 2 wins with the right-to-left diagonal line!"
        return true
   end
   
end

def new_game_check
    puts "The game has now ended. Play again? Type \[y/n]"
    ng = gets.chomp
    check = false

    while check == false
        if ng == "y"
            check = true
            return true
        elsif ng == "n"
            puts "See ya later!"
            check = true
        else
            puts "I'm sorry, I didn't understand that. Please type \[y/n]"
        end
    end
end

player1 = Player.new("X ", "Player 1")
player2 = Player.new("O ", "Player 2")

def game(p1, p2)
    x = [['_ ', '_ ' , '_ '], ['_ ', '_ ', '_ '], ['_ ', '_ ', '_ ']]
    game_end = false

    while game_end == false
        p1.play(x)
        if win_check(x) == true
            game_end = true
        else
            p2.play(x)
            game_end = true if win_check(x) == true
        end
        
    end

    if game_end == true && new_game_check == true
        game_end == false
        x = [['_ ', '_ ' , '_ '], ['_ ', '_ ', '_ '], ['_ ', '_ ', '_ ']]
        player1 = Player.new("X ", "Player 1")
        player2 = Player.new("O ", "Player 2")
        puts game(player1, player2)
    end
end

puts game(player1, player2)



