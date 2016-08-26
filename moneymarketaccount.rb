require 'CSV'
require_relative "Account"
module Bank
  class MoneyMarketAccount < Account

    attr_accessor :account_balance, :id, :check_counter, :transaction_counter

    def initialize(balance)
      super(id, balance, creation_date)
      @id = rand(111111..999999)
      @fee_counter = 0
      @transaction_counter = 0

      if @balance < 10000.00
        raise ArgumentError.new("invalid initial balance")
      end
    end

    def monthly_limit
        puts "You cannot make anymore transactions this month."
        return @balance
    end

    def withdraw(withdrawal, fee)
      if @transaction_counter >= 6
        return monthly_limit
      end

      if @balance - withdrawal.to_f >= 10000.00
        @balance -= (withdrawal.to_f + fee.to_f)
        @transaction_counter += 1
        return @balance

      elsif @balance < 10000.00 && @fee_counter == 1
        # would have put this in a method for multiple calls if enough time
        puts "You are overdrawn and cannot withdraw that amount. A $100 fee has been applied."
        return @balance

      elsif @balance - withdrawal.to_f < 10000.00
        fee = 100
        @balance -= (withdrawal.to_f + fee.to_f)
        @fee_counter += 1
        @transaction_counter += 1
        puts "You are overdrawn and cannot withdraw that amount. A $100 fee has been applied."
        return @balance
      end
    end

    def deposit(deposited)
      if @transaction_counter >= 6
        return monthly_limit
      end

        if @balance < 10000.00
          if (@balance + deposited.to_f) >= 10000.00
            @balance += deposited.to_f
            @fee_counter = 0
            return @balance
          end
        else
          @balance += deposited.to_f
          @transaction_counter += 1
          return @balance
        end
    end

    def add_interest(rate)
      super(rate.to_f)
    end

    def reset_transactions
      @transaction_counter = 0
    end

  end
end
