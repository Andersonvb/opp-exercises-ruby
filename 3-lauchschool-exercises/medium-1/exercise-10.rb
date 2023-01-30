class Card
  include Comparable
  attr_reader :rank, :suit

  RANKS = {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(card)
    RANKS[@rank.to_s] <=> RANKS[card.rank.to_s]
  end

  def rank_value
    RANKS[@rank.to_s]
  end
end

class Deck
  attr_reader :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    build_cards
  end

  def draw
    build_cards if @deck.empty?
    @deck.shift
  end

  private

  def build_cards
    SUITS.each do |suit|
      RANKS.each { |rank| @deck << Card.new(rank, suit) }
    end
    @deck.shuffle!
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(deck)
    @deck = deck
  end

  def print
    @deck.each do |card|
      puts "#{card.rank} - #{card.suit}"
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # Evaluamos que todas las cartas tengan el mismo suit
    return false unless @deck.all? { |card| card.suit == @deck[0].suit }

    # Evaluamos que los valores de las cartas sean consecutivos y que la primera carta tenga un valor de 10
    @deck.sort.each_cons(2).all? { |a, b| b.rank_value == a.rank_value + 1 } && @deck.sort[0].rank_value == 10
  end

  def straight_flush?
    # Evaluamos que todas las cartas tengan el mismo suit
    return false unless @deck.all? { |card| card.suit == @deck[0].suit }

    # Evaluamos que los valores de las cartas sean consecutivos
    @deck.sort.each_cons(2).all? { |a, b| b.rank_value == a.rank_value + 1 }
  end

  def four_of_a_kind?
    @deck.group_by { |card| card.rank_value }.values.any? { |group| group.size == 4 }
  end

  def full_house?
    @deck.map { |card| card.rank_value }.uniq.size == 2
  end

  def flush?
    @deck.map { |card| card.suit }.uniq.size == 1
  end

  def straight?
    @deck.sort.each_cons(2).all? { |a, b| b.rank_value == a.rank_value + 1 }
  end

  def three_of_a_kind?
    @deck.map { |card| card.rank_value }.group_by { |rank| rank }.values.any? { |arr| arr.size == 3 }
  end

  def two_pair?
    pairs = @deck.map { |card| card.rank_value }.group_by { |rank| rank }.values.group_by { |arr| arr.size == 2}

    pairs[true].nil? ? false : pairs[true].size == 2
  end

  def pair?
    @deck.map { |card| card.rank_value }.group_by { |rank| rank }.values.any? { |group| group.size == 2}
  end
end

#hand = PokerHand.new(Deck.new.deck)
#hand.print
#puts hand.evaluate


# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end


# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'High card'
