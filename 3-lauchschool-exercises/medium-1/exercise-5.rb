class Minilang
  def initialize(input)
    @input = input
    @stack = []
    @register = input.start_with?(/[0-9]+/) ? input[0].to_i : 0
  end

  def eval
    words = @input.split()

    words.each do |word|

      case word
        when /[0-9]/
          @register = word.to_i
        when "PUSH"
          @stack << @register.to_i
        when "ADD"
          @register += @stack.pop
        when "SUB"
          @register -= @stack.pop
        when "MULT"
          @register *= @stack.pop
        when "DIV"
          @register /= @stack.pop 
        when "MOD"
          @register %= @stack.pop 
        when "POP"
          if @stack.empty?
            puts "Empty stack!"
            return
          else
            @register = @stack.pop 
          end
        when "PRINT"
          puts @register
        else
          puts "Invalid token #{word}"
          return
      end
    end
  end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
