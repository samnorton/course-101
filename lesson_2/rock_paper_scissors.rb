VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard')
end

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
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice)
  prompt("You chose: #{choice}, computer choose: #{computer_choice}")

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!\n Have a nice day! Good bye!")
