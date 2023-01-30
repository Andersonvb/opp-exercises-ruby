class GuessingGame
  def initialize
    @number = rand(0..100)
    @lives = 7
  end

  def play
    until @lives == 0
      print "You have #{@lives} guesses remaining.\n"
      print "Enter a number between 1 and 100: "
      user_number = gets.chomp.to_i

      if user_number < 1 || user_number > 100
        print "Invalid guess.\n\n"
        next
      elsif user_number < @number
        print "Your guess is too low.\n\n"
      elsif user_number > @number
        print "Your guess is too high.\n\n"
      elsif user_number == @number
        print "That's the number!\n\nYou won!\n\n"
        break
      end

      @lives -= 1
      if @lives == 0
        print "You have no more guesses. You lost!\n\n"
      end
    end

  end
end

game = GuessingGame.new
game.play
