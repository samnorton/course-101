#!/usr/bin/env ruby -w

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  Kernel.puts("=>#{message}")
end

@player_count = 0
@computer_count = 0
@end_game = false

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'p' && second == 'r') ||
    (first == 'sc' && second == 'p') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'l' && second == 'sp') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'sc' && second == 'l')
end

def display_results(player, computer)
  if win?(player, computer)
    @player_count += 1
    if @player_count == 5
      @end_game = true
      prompt("You have 5 wins! You won the game!")
    else
      prompt("You won this round!")
    end
  elsif win?(computer, player)
    @computer_count += 1
    if @computer_count == 5
      @end_game = true
      prompt("Computer have 5 wins! You loose this game!")
    else
      prompt("Computer won this round!")
    end
  else
    prompt("It's a tie! No one wins!")
  end

  prompt("Player: #{@player_count}")
  prompt("Computer: #{@computer_count}")
end

until @end_game
  loop do # main loop
    choice = ''
    loop do
      prompt("Choose a key:")
      VALID_CHOICES.each do |k, v|
        prompt("#{k} for #{v}")
      end
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample

    display_results(choice, computer_choice)
    prompt("You chose: #{VALID_CHOICES[choice]}")
    prompt("computer choose: #{VALID_CHOICES[computer_choice]}")
    break unless @end_game == true

    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
    @player_count = 0
    @computer_count = 0
    @end_game = false
  end
end
prompt("Thank you for playing!\n Have a nice day! Good bye!")
