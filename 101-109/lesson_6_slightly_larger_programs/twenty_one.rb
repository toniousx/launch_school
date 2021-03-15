require 'pry-byebug'

=begin
PEDAC
- Problem understanding:
  - mental model:
    - Create a Twenty-One game: with some card values get as close to 21 as
    possible,without going over. If you go over 21, it's a "bust" and you lose.
  - input: get strings
  - output: 'winner is...'
  - rules:
    - 52-card deck consisting of the 4 suits (hearts, diamonds,
    clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack,
    queen, king, ace).
    - Setup: the game consists of a "dealer" and a "player".
    Both participants are initially dealt 2 cards.
    The player can see their 2 cards, but can only see one of the dealer's cards
    - Card	Value
      2 - 10	face value
      jack, queen, king	10
      ace	1 or 11
    - Player turn: the player goes first, and can decide to either "hit"
    or "stay". A hit means the player will ask for another card.
    Remember that if the total exceeds 21, then the player "busts" and loses.
    - when the player stays, it's the dealer's turn. The dealer must follow
    a strict rule for determining whether to hit or stay: hit until the total
    is at least 17. If the dealer busts, then the player wins.
    - Comparing cards: when both the player and the dealer stay, it's time to
    compare the total value of the cards and see who has the highest value.
  - Examples:
   - dealer is showing a "10" (the other card is hidden), and the player has
   a "2" and a "4", then the obvious choice is for the player to "hit"
   tbc
  - Data structure:
    CARDS(hash if 52 cards)
  - Algorithm:
    - from 52 card have 2 random cards from:
      - user
      - computer
    - first one random card of computer/you is shown.
    - 1st you decide to 'stay'(next move from the other player)
    or 'hit'(ask for another card)[repeat until 'bust or 'stay']
    if player 'bust' computer win
    - then computer(dealer) decide to hit/stay.
    - when dealer stays to both show cards to see who won.
    - if somebody have bigger number than 21 loses the game.
    if dealer busts player win game
    - if both stay the closest player to 21 win the game.
  - Code
=end

# (hearts, diamonds, clubs, and spades): :h, :d, c:, s:
# heart cards
suits = [:♥, :♦, :♣, :♠]
special_c = [:j, :k, :q, :a]
cards = {}
suits.each do |suit|
  2.upto(10) { |num| cards["#{suit}_#{num}".to_sym] = num }
  special_c.each do |elem|
    cards["#{suit}_#{elem}".to_sym] = if elem == :a
                                        [1, 11]
                                      else
                                        10
                                      end
  end
end

DECK = cards
PLAY = { player: 'Player', dealer: 'Dealer' }
OPTIONS = { 'h' => 'Hit', 's' => 'Stay' }
current_gambler = 'Dealer'
count_rounds = { player: 0, dealer: 0, tie: 0, rounds: 0 }
MAX_OF_ROUNDS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def stop_and_continue
  puts "press enter to continue"
  gets.chomp
end

def display_welcome
  system 'clear'
  puts
  puts "=*" * 8
  puts "Welcome to 21".upcase.center(15)
  puts "=*" * 8
  puts
  stop_and_continue
end

def turn(gambler)
  if gambler == 'Player'
    PLAY[:dealer]
  else
    PLAY[:player]
  end
end

def as_card_present?(cards)
  cards.any? { |card| card.end_with?('a') }
end

def as_cards(cards)
  cards.select { |card| card.end_with? 'a' }
end

def cards_without_as(cards)
  cards.select { |card| !(card.end_with? 'a') }
end

def values_of(cards)
  no_as_card_vals = cards_without_as(cards).map { |card| DECK[card] }
  as_card_vals = as_cards_values(cards)

  as_card_present?(cards) ? (no_as_card_vals + as_card_vals) : no_as_card_vals
end

def cards_without_as_values(cards)
  no_ases_cards = cards_without_as(cards)
  values_of(no_ases_cards)
end

def as_cards_values(cards)
  if as_card_present?(cards)
    as_card_values = []

    as_cards(cards).each do |as_card|
      no_as_card_values = cards_without_as_values(cards)

      as_card_values << if (as_card_values + no_as_card_values).sum <= 10
                          DECK[as_card][1]
                        else
                          DECK[as_card][0]
                        end
    end
    as_card_values
  else
    0
  end
end

def get_first_each_two(player_cards, dealer_cards)
  player_cards.concat([DECK.keys.sample, DECK.keys.sample])
  dealer_cards.concat([DECK.keys.sample, DECK.keys.sample])
end

# rubocop:disable Metrics/AbcSize
def full_game_display(player_cards, dealer_cards, gambler)
  player_card_vals    = values_of(player_cards)
  player_show_card    = player_card_vals.first
  dealer_show_card    = values_of(dealer_cards).first
  hidden_player_cards = player_card_vals[1, player_card_vals.size]

  prompt "Right now is #{gambler.upcase} turn"
  puts
  puts '-- CARDS --'
  prompt "Dealer show: #{dealer_cards.first} [#{dealer_show_card}]"
  prompt "Player show: #{player_cards.first} [#{player_show_card}]"
  puts
  puts '=' * 10
  prompt "your hidden cards: #{player_cards[1..-1]} #{hidden_player_cards}"
  puts '=' * 10
end
# rubocop:enable Metrics/AbcSize

def display_player_total(cards)
  puts
  puts '-' * 10
  prompt "Your total so far: #{values_of(cards).sum}"
  puts '-' * 10
end

def dont_switch_player_turn(gambler, total_cards)
  gambler = gambler == PLAY[:dealer] ? PLAY[:player] : PLAY[:dealer]
  play(total_cards, gambler)
end

def hit(gambler, total_cards, current_player_cards)
  system 'clear'
  puts "#{gambler} decided to hit"
  current_player_cards << DECK.keys.sample
  dont_switch_player_turn(gambler, total_cards)
end

def stay(gambler)
  system 'clear'
  true if gambler == PLAY[:dealer]
end

def dealer_stays?(gambler)
  !!stay(gambler)
end

def player_selection(gambler, player_cards, total_cards, selection)
  if OPTIONS[selection] == 'Hit'
    hit(gambler, total_cards, player_cards)
  else
    prompt "#{gambler} decided to stay"
    stay(gambler)
  end
end

def computer_decision(gambler, dealer_cards, total_cards)
  if gambler == PLAY[:dealer]
    shown_player_c = values_of([total_cards[0].first])
    dealer_sum     = values_of(dealer_cards).sum

    if dealer_sum <= 10
      hit(gambler, total_cards, dealer_cards)
    elsif [11..14].include?(dealer_sum) && [9..11].include?(shown_player_c)
      hit(gambler, total_cards, dealer_cards)
    else
      prompt "#{gambler} decided to stay"
      stay(gambler)
    end
  end
end

def player_decision(gambler, player_cards, total_cards)
  selection = ''

  if gambler == PLAY[:player]
    loop do
      prompt "What do you want to do?"
      puts
      puts "Type and press enter:"
      OPTIONS.each do |key, val|
        puts "'#{key}' for #{val}"
      end
      selection = gets.chomp
      break if OPTIONS.keys.include?(selection)
    end
    player_selection(gambler, player_cards, total_cards, selection)
  end
end

def someone_busted?(total_cards)
  total_cards.any? { |cards| values_of(cards).sum > 21 }
end

def play(total_cards, current_gambler)
  player_cards = total_cards[0]
  dealer_cards = total_cards[1]

  loop do
    break if someone_busted?(total_cards)
    current_gambler = turn(current_gambler)

    full_game_display(player_cards, dealer_cards, current_gambler)
    display_player_total(player_cards)
    player_decision(current_gambler, player_cards, total_cards)
    computer_decision(current_gambler, dealer_cards, total_cards)

    break if dealer_stays?(current_gambler)
  end
end

def winner_and_busted_player(result_player)
  if result_player > 21
    puts "#{PLAY[:dealer]} because #{PLAY[:player]} is busted"
    PLAY[:dealer]
  else
    puts "#{PLAY[:player]} because #{PLAY[:dealer]} is busted"
    PLAY[:player]
  end
end

def choose_winner(total_cards, count_rounds)
  result_player = values_of(total_cards[0]).sum
  result_dealer = values_of(total_cards[1]).sum

  if result_player > 21 || result_dealer > 21
    winner_and_busted_player(result_player)
  elsif result_player == result_dealer
    count_rounds[:tie] += 1
    "no one! Because is a tie!"
  elsif result_player >= result_dealer
    PLAY[:player]
  elsif result_player <= result_dealer
    PLAY[:dealer]
  end
end

def total_cards_display(total_cards)
  puts
  total_cards.each_with_index do |cards, idx|
    puts "--- #{PLAY.values[idx].upcase} ---"
    prompt "Cards: #{cards}"
    prompt "Result: #{values_of(cards).sum}"
    puts
  end
end

def display_round_winner(total_cards, count_rounds)
  winner = choose_winner(total_cards, count_rounds)
  prompt "The round winner is #{winner}!"
  puts
end

def round_count_winner(count_rounds, total_cards)
  winner = choose_winner(total_cards, count_rounds)
  if winner == PLAY[:player]
    count_rounds[:player] += 1
  elsif winner == PLAY[:dealer]
    count_rounds[:dealer] += 1
  end
end

def display_total_rounds_info(count_rounds)
  puts '-' * 10
  puts "Total rounds wins:"
  puts "By Player: #{count_rounds[:player]}"
  puts "By Dealer: #{count_rounds[:dealer]}"
  puts "Number of ties: #{count_rounds[:tie]}"
  puts '-' * 10
end

def display_round_results_so_far(total_cards, count_rounds)
  count_rounds[:rounds] += 1
  puts "Result of this round"
  total_cards_display(total_cards)
  puts "There are #{count_rounds[:rounds]} rounds played so far"
  display_total_rounds_info(count_rounds)
end

def display_final_winner(total_cards, count_rounds)
  winner = choose_winner(total_cards, count_rounds)
  puts '=' * 10
  prompt "The final Winner of #{MAX_OF_ROUNDS} rounds".upcase
  prompt "is #{winner}!".upcase
  puts '=' * 10
  puts
end

def display_final_result(count_rounds)
  puts "=" * 10
  puts "Result of the game".upcase
  puts "-" * 10
  puts "On #{count_rounds[:rounds]} played"
  display_total_rounds_info(count_rounds)
end

def end_game
  prompt "Bye, thanks for playing Twenty one!"
end

def stop_playing_rounds?(count_rounds, total_cards)
  prompt "Do you want to pay again? "
  puts "Type 'y' or 'yes' and Enter. Or another combination to stop the game"
  answer = gets.chomp
  system 'clear'
  if count_rounds[:rounds] > MAX_OF_ROUNDS
    display_final_result(count_rounds)
    display_final_winner(total_cards, count_rounds)
  elsif answer.downcase.start_with?('y')
    false
  else
    true
  end
end

display_welcome

loop do
  player_cards = []
  dealer_cards = []

  get_first_each_two(player_cards, dealer_cards)

  total_cards = [player_cards, dealer_cards]
  play(total_cards, current_gambler)
  round_count_winner(count_rounds, total_cards)
  display_round_results_so_far(total_cards, count_rounds)
  display_round_winner(total_cards, count_rounds)
  break if stop_playing_rounds?(count_rounds, total_cards)
end

end_game

=begin
Pending:
- What if we wanted to change this game to Thirty-One, and the dealer hits
  until 27? Or what if our game should be Forty-One? Or Fifty-One? In other
  words, the two major values right now -- 21 and 17 -- are quite arbitrary.
  We can store them as constants and refer to the constants throughout
  the program. If we wanted to change the game to Whatever-One,
  it's just a matter of updating those constants.
=end
