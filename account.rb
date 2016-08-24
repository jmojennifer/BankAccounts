require 'money'
module Bank
  class Account

    attr_accessor :balance

    def initialize(initial_balance_input, account_owner_name)
      @initial_balance = Money.new(initial_balance_input * 100, "USD")
      @account_owner = Bank::Owner.new(account_owner_name)
      @id = rand(111111..999999)
      @balance = balance

      if @initial_balance < Money.new(0, "USD")
        raise ArgumentError.new("negative initial balance")
      else
        @balance = @initial_balance
      end
    end

    def current_balance
      puts "Your current balance is $#{ @balance }."
      return @balance
    end

    def withdraw(withdrawn)
      if @balance - Money.new(withdrawn * 100, "USD") < 0
        puts "You can't withdraw that much money. It would result in a negative balance."
        return @balance
      else
        @balance -= Money.new(withdrawn * 100, "USD")
        current_balance
      end
    end

    def deposit(deposited)
      @balance += Money.new(deposited * 100, "USD")
      current_balance
    end
  end
end
