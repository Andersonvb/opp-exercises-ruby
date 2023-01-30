class GuessingGame
  def initialize(min, max)
    @min = min
    @max = max
    @number = rand(min..max)
    @lives = Math.log2(max - min).to_i + 1
  end

  def play
    until @lives == 0
      print "You have #{@lives} guesses remaining.\n"
      print "Enter a number between #{@min} and #{@max}: "
      user_number = gets.chomp.to_i

      if user_number < @min || user_number > @max
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

game = GuessingGame.new(501, 1500)
game.play
