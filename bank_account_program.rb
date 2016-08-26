require_relative 'account'
require_relative 'owner'




# User-friendly program written for Wave 1

# puts "\n\nPlease enter the initial balance of the account: "
# initial_amount = gets.chomp.to_f
# puts "\n\nPlease enter the primary account holder's name: "
# name = gets.chomp
# account = Bank::Account.new(initial_amount, name)

# puts "\n\nPlease enter what you'd like to do (Check Balance, Withdraw Money, Deposit Money)"
# action = gets.chomp.downcase
#
# until action == "check balance" || action == "withdraw money" || action == "deposit money"
#   puts "\n\nPlease enter a valid option."
#   action = gets.chomp.downcase
# end
#
#
# if action == "check balance"
#   account.current_balance
#
# elsif action == "withdraw money"
#   puts "\n\nHow much money would you like to withdraw?"
#   withdraw_amount = gets.chomp.to_f
#   account.withdraw(withdraw_amount)
#
# elsif action == "deposit money"
#   puts "\n\nHow much money would you like to deposit?"
#   deposit_amount = gets.chomp.to_f
#   account.deposit(deposit_amount)
# end
