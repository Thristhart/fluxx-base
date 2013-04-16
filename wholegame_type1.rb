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

def p1p(index)
  $p1.play($p1.hand[index], $game.ruleset)
end
def p2p(index)
  $p2.play($p2.hand[index], $game.ruleset)
end


p1p 0 # captain's parrot: win if parrot and captain's hat
$game.next_turn

p2p 0 # parrot
$game.next_turn

p1p -1 # key
$game.next_turn

p2p -1 # limes
$game.next_turn

p1p -1 # gunpowder
$game.next_turn

p2p 1 # oranges
$game.next_turn

p1p -1 # keg
$game.next_turn

p2p -1 # Royal Colors
$game.next_turn

p1p 1 # Rum
$game.next_turn

p2p 1 # Land Ho! - win if island and 1 ship
$game.next_turn

p1p 2 # Draw 2
$game.next_turn

p2p -1 # Powder Monkey - win if gunpowder and monkey
$game.next_turn

p1p -1 # Keg of Rum - Win if Keg and Rum... should be I Win!
$game.next_turn

p $p1.keepers
p $p2.keepers

p $p1.hand
p $p2.hand

