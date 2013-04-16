$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'fluxx'
require 'fluxx/cards'

# sanity's sake
class Fluxx::Card
  def inspect
    return "#{@name}: #{@description}\n"
  end
end

srand 256

$game = Fluxx::Game.new


$p1 = Fluxx::Player.new
$p2 = Fluxx::Player.new

$game.players << $p1;
$game.players << $p2;

$game.deck = Fluxx::Library.set(:pirate)

$game.start

$p1.give Fluxx::Library["Gems"]
$p1.play $p1.hand[-1], $game.ruleset
$game.next_turn
$p2.give Fluxx::Library["Rubies"]
$p2.play $p2.hand[-1], $game.ruleset
$game.next_turn
$p1.give Fluxx::Library["Pearls"]
$p1.play $p1.hand[-1], $game.ruleset
$game.next_turn
$p2.give Fluxx::Library["Diamonds"]
$p2.play $p2.hand[-1], $game.ruleset
$game.next_turn
$p1.give Fluxx::Library["Dinghy"]
$p1.play $p1.hand[-1], $game.ruleset
$game.next_turn
$p2.give Fluxx::Library["Emeralds"]
$p2.play $p2.hand[-1], $game.ruleset
$game.next_turn

p $p1.keepers
p $p2.keepers

p $p1.hand
p $p2.hand

