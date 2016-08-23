require 'money'
module Bank
  class Account

    attr_accessor :balance

    def initialize(initial_balance_input)
      @initial_balance = Money.new(initial_balance_input * 100, "USD")
      @id = rand(111111..999999)
      @balance = balance

      if @initial_balance < Money.new(0, "USD")
        raise ArgumentError.new("negative initial balance")
      else
        @balance = @initial_balance
      end
    end

    def balance_check
      puts "Your current balance is $#{ @balance }."
      return @balance
    end

    def withdraw(withdrawn)
      if @balance - Money.new(withdrawn * 100, "USD") < 0
        puts "You can't withdraw that much money. It would result in a negative balance. Please try again."
        return @balance
      else
        @balance -= Money.new(withdrawn * 100, "USD")
        return @balance
      end
    end

    def deposit(deposited)
      @balance += Money.new(deposited * 100, "USD")
      return @balance
    end
  end
end
