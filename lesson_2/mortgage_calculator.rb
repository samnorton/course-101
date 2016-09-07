require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_msg.yml')

LANGUAGE = 'en'

def prompt(message)
  Kernel.puts("=>#{message}")
end

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

prompt(messages('welcome', LANGUAGE))

loop do # main loop
  loan_amt = ''
  loop do
    prompt(messages('loan_amt', LANGUAGE))
    loan_amt = Kernel.gets.chomp

    break if valid_number?(loan_amt)
    prompt(messages('not_valid_num', LANGUAGE))
  end

  apr_amt = ''
  loop do
    prompt(messages('APR_amt', LANGUAGE))
    apr_amt = Kernel.gets.chomp

    break if valid_number?(apr_amt)
    prompt(messages('not_valid_num', LANGUAGE))
  end

  loan_duration = ''
  loop do
    prompt(messages('loan_duration', LANGUAGE))
    loan_duration = Kernel.gets().chomp()

    break if valid_number?(loan_duration)
    prompt(messages('not_valid_num', LANGUAGE))
  end

  annual_interest_rate = apr_amt.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i() * 12

  monthly_payment = loan_amt.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  prompt(messages('reset', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('goodbye_msg', LANGUAGE))
