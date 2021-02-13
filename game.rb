# module for keeping all methods for display
module Display
    def display_intro
      "Lets play Tic Tac Toe"
    end
    def display_name_promp(number)
      "Please endtere the name of the player ##{number}"
    end
  
    def display_symbol_promp
      "Please make your choise 'X' or 'O'? "
    end
  
    def display_first_sybol(dublicate)
      "It can not be #{dublicate}"
    end

    def display_introduce_pls(name1, symbol1, name2, symbol2)
        "#{name1}  goes with #{symbol1}, #{name2} goes with #{symbol2}. Let's rock mazafakas"
    end
    
    def display_turns(name)
        "It's #{name}'s move"
    end
  end
# Baord class for creating a board and manupulating the cells
class Board 
    attr_reader :cells
  
    WINNIG_COMPOSITION = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [8, 5, 2], 
      [7, 4, 1], [6, 3, 0], [2, 4, 5], [8, 4, 0]
      ]
  
    def initialize
      @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def show
      puts <<-HEREDOC
          #{@cells[8]} | #{@cells[7]} | #{@cells[6]} 
         ---+---+---
          #{@cells[5]} | #{@cells[4]} | #{@cells[3]} 
         ---+---+---
          #{@cells[2]} | #{@cells[1]} | #{@cells[0]} 
         ---+---+---
         HEREDOC
    end
  
    def update_cell(number, symbol)
      @cells[number - 1] = symbol
    end
  
    def valid_number?(number)
      @cells[number - 1] == number
    end

    def full?
        cells.all?{|integer| integer == "X" || integer == "O"}
    end  

    def game_over?
      WINNIG_COMPOSITION. any? do |combo|
          [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
      end
    end
end

class Players 
    attr_accessor :name, :symbol
    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end 
end

class Game
    include Display
    attr_accessor :first_palyer, :second_player, :symbol, :board
    def initialize
        @first_palyer = nil
        @second_player = nil
        @symbol = nil
        @board = Board.new
    end

    def player_creater(number, symbol = nil)
        puts display_name_promp(number)
        name = gets.chomp
        puts display_symbol_promp
        symbol = gets.chomp
        player = Players.new(name, symbol)
    end

    def game_setter
        puts display_intro
        @first_palyer = player_creater(1)
        @second_player = player_creater(2)
        puts display_introduce_pls(first_palyer.name, first_palyer.symbol, second_player.name, second_player.symbol)
        @board.show
    end

    def play
         puts display_turns(first_palyer.name)
         number = gets.chomp.to_i
         board.update_cell(number, first_palyer.symbol)
         board.show
         puts display_turns(second_player.name)
         number2 = gets.chomp.to_i
         board.update_cell(number2, second_player.symbol)
         board.show
    end

    def conclusion
        
        
    end
        

end

test_game = Game.new

test_game.game_setter
test_game.play