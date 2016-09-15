#!/usr/bin/env ruby -w

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_COMBO = {
  'r' => %w(sc l),
  'p' => %w(r sp),
  'sc' => %w(p l),
  'l' => %w(sp p),
  'sp' => %w(sc r)
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

counts = { player: 0, computer: 0 }

def display_results(player, computer, counts)
  prompt(
    if counts[:player] == 5 then "MSG: You won this game! (5 wins)!"
    elsif counts[:computer] == 5 then "MSG: Computer won this game! (5 wins)"
    elsif win?(player, computer) then "MSG: You won this round!"
    elsif win?(computer, player) then "MSG: Computer won this round! You loose!"
    else "MSG: It's a tie on this round! No one wins!"
    end
  )
end

def count_wins(player, computer, counts)
  if win?(player, computer)
    counts[:player] += 1
  elsif win?(computer, player)
    counts[:computer] += 1
  end
  prompt("Player Count: #{counts[:player]}")
  prompt("Computer Count: #{counts[:computer]}")
end

loop do # main loop
  choice = ''
  loop do
    prompt("Choose a key:")
    VALID_CHOICES.each do |short_name, complete_name|
      prompt("'#{short_name}' for #{complete_name}")
    end
    choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample
  prompt("You chose: #{VALID_CHOICES[choice]}")
  prompt("Computer choose: #{VALID_CHOICES[computer_choice]}")

  if counts[:player] >= 5 || counts[:computer] >= 5
    counts = { player: 0, computer: 0 }
  end

  count_wins(choice, computer_choice, counts)
  display_results(choice, computer_choice, counts)
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
  clear_screen
end

