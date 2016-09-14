#!/usr/bin/env ruby -w

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_COMBO = {
  'r' => ['sc', 'l'],
  'p' => ['r', 'sp'],
  'sc' => ['p', 'l'],
  'l' => ['sp', 'p'],
  'sp' => ['sc', 'r']
}


def prompt(message)
  Kernel.puts("=>#{message}")
end


def win?(first, second)
  WINNING_COMBO[first].include?(second)
end

def clear_screen
 system('clear') || system('cls')
end

player_count = 0
computer_count = 0

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won! You loose!")
  else
    prompt("It's a tie! No one wins!")
  end
end

  loop do # main loop
    choice = ''
    loop do
      prompt("Choose a key:")
      VALID_CHOICES.each do |short_name, complete_name|
        prompt("'#{short_name}' for #{short_name}")
      end
      choice = Kernel.gets().chomp().downcase()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.keys.sample

    display_results(choice, computer_choice)
    prompt("You chose: #{VALID_CHOICES[choice]}")
    prompt("Computer choose: #{VALID_CHOICES[computer_choice]}")

    prompt("Do you want to play again? ('yes' or 'no')")

  loop do  
    answer = Kernel.gets().chomp()
    if answer.casecmp('yes').zero?
      break
    elsif answer.casecmp('no').zero?
      prompt("Thank you for playing!\n  Have a nice day! Good bye!")
      exit
    else
      prompt("Please enter either 'yes' or 'no'.")
    end
  end
  end


