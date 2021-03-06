require_relative './player'
require_relative './computer'
require_relative './evaluator'
class Game
  attr_reader :a, :b, :hand, :message, :turn

  def self.start(player1, player2)
    @game = Game.new(player1, player2)
  end

  def initialize(player1, player2)
    @a = player1
    @b = player2
    @turn = @a
    @not_in_turn = @b
  end

  def self.instance
    @game
  end

  def rock
    @turn.hand = :rock
    turn_switcher
  end

  def paper
    @turn.hand = :paper
    turn_switcher
  end

  def scissors
    @turn.hand = :scissors
    turn_switcher
  end

  def bot_move
    @b.random_hand
    evaluate
  end

  def turn_switcher
    @turn = @not_in_turn
    @not_in_turn = (@not_in_turn == @b ? @a : @b)
  end

  def evaluate
    @message = "It's a draw! Try again!" if draw?
    @message = "#{@b.name} won!!" if b_wins?
    @message = "#{@a.name} won!!" if a_wins?
  end

private

  def draw?
    @a.hand == @b.hand
  end

  def a_wins?
    @a.hand == :rock && @b.hand == :scissors || @a.hand == :paper && @b.hand == :rock || @a.hand == :scissors && @b.hand == :paper
  end

  def b_wins?
    @a.hand == :paper && @b.hand == :scissors || @a.hand == :scissors && @b.hand == :rock || @a.hand == :rock && @b.hand == :paper
  end

end
