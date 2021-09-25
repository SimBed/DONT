require 'card.rb'
require 'deck.rb'
require 'hand.rb'

class StaticPagesController < ApplicationController
  # setting Deck.new to a constant rather Deck.new.cards causes the constant to have a cards attribute as [] when a duplicated deck is dealt
  Ordered_cards = Deck.new.cards

  def deal
    # the Deck class's deal method uses slice on deck.cards array redcuing it to [] after each deal
    deck = Deck.new
    begin
      # without the dup method Ordered_cards itself gets reduced to [] when deck is dealt
      deck.cards = Ordered_cards.dup
      deck.shuffle
      hands = deck.deal
    end until hands[0].weak_1NT? && hands[2].weak?(7) || hands[0].strong_1NT? && hands[2].weak?(6)
    @hands = hands
    @west = @hands[0]
    @north = @hands[1]
    @east = @hands[2]
    @south = @hands[3]
  end
end
