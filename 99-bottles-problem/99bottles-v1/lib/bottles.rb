class Bottles

  def verse(n)
    %(#{n >= 1 ? n : "No more"} bottle#{"s" if n != 1} of beer on the wall, #{n >= 1 ? n : "no more"} bottle#{"s" if n != 1} of beer.\n#{ n != 0 ? "Take #{n != 1 ? "one" : "it"} down and pass it around" : "Go to the store and buy some more" }, #{n == 1 ? "no more" : n == 0 ? 99 : n - 1 } bottle#{"s" if n != 2} of beer on the wall.\n)
  end

  def verses(n, m)
    n.downto(m).map { |x| verse(x) }.join("\n")
  end

  def song
    verses(99, 0)
  end

end
