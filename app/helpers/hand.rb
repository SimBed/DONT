class Hand

    attr_accessor :cards, :player

    def initialize(cards, player)
      @cards = cards
      @player = player
    end

    def points
      points = 0
      @cards.each { |c| points += c.points }
      points
    end

    def distribution
      suit_count = { C: 0, D: 0, H: 0, S: 0 }
      @cards.each do |card|
        suit_count[card.suit.to_sym] += 1
      end
      suit_count
    end

    def length_of_longest_suit
      distribution.values.max
    end

    def length_of_shortest_suit
      distribution.values.min
    end

    def length_of_2nd_longest_suit
      h = distribution
      h.delete(h.key(length_of_longest_suit))
      h.values.max
    end

    def length_of_2nd_shortest_suit
      Deck::CARDS - length_of_longest_suit - length_of_shortest_suit - length_of_2nd_longest_suit
    end

    def in_order
      # want to sort red/black. Can't claim to fully understand code
      @cards.sort_by! { |card| [card.suit.tr("CDHS", "CDSH"), -card.value] }
      self
    end

    def group_by_suit
      in_order
      @cards.chunk_while { |i, j| (i.suit == j.suit) }.to_a
    end

    def summary
      puts "Player #{@player}, #{points} points:"
      @cards.each do |card|
        print "#{card.to_s} "
      end
      puts
    end

    def distribution_summary
      "#{length_of_longest_suit}-#{length_of_2nd_longest_suit}-#{length_of_2nd_shortest_suit}-#{length_of_shortest_suit}"
    end

    def balanced?
      length_of_longest_suit <= 5 && length_of_shortest_suit >=2 && length_of_2nd_shortest_suit == 3
    end

    def weak_1NT?
      balanced? && points.between?(12,14)
    end

    def strong_1NT?
      balanced? && points.between?(15,17)
    end

    def _1NT?
      strong_1NT? || weak_1NT?
    end

    def less_than?(points)
      self.points <= points
    end

    def _4card_major?
      distribution[:H] == 4 || distribution[:S] == 4
    end

    def _4_5in_majors?
      distribution[:H] * distribution[:S] == 20
    end

    def weak2?
      (distribution[:D] == 6 || distribution[:H] == 6 || distribution[:S] == 6) && points.between?(4,10)
    end
  end
