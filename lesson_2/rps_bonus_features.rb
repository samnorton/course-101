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

def win?(first, second)
  (first == 'rock' && second == VALID_CHOICES['sc']) ||
  (first == 'paper' && second == VALID_CHOICES['r']) ||
  (first == 'scissors' && second == VALID_CHOICES['sc']) ||
  (first == 'paper' && second == VALID_CHOICES['sp']) ||
  (first == 'spock' && second == VALID_CHOICES['sc']) ||
  (first == 'lizard' && second == VALID_CHOICES['sp']) ||
  (first == 'rock' && second == VALID_CHOICES['l']) ||
  (first == 'lizard' && second == VALID_CHOICES['p']) ||
  (first == 'scissors' && second == VALID_CHOICES['l'])
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
    prompt("Choose a key:")
    VALID_CHOICES.each do |k, v|
       prompt("'#{k}'' for #{v}")
    end
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample
  display_results(choice, computer_choice)
  prompt("You chose: #{VALID_CHOICES[choice]}, computer choose: #{computer_choice}")

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!\n Have a nice day! Good bye!")
