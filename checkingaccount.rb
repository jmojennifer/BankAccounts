require_relative "Account"
module Bank
  class CheckingAccount < Account

    attr_accessor :account_balance, :id, :check_counter

    def initialize(balance)
      super(id, balance, creation_date)
      @id = rand(111111..999999)
      @check_counter = 0
      if @balance < 0
        raise ArgumentError.new("invalid initial balance")
      end
    end

    def withdraw(withdrawn, fee)
      super(withdrawn, fee)
      min_withdrawal_threshold = 1.00
      return @balance
    end

    def withdraw_using_check(withdrawn)
      if @check_counter < 3 && @balance - withdrawn > -10
        @balance -= withdrawn
        @check_counter += 1
        return @balance

      elsif @balance - withdrawn < -10
        puts "Your account is in overdraft, and you cannot have anymore withdrawals."
        return @balance

      elsif @check_counter >= 3 && @balance - (withdrawn + 2) > -10
        @balance = @balance - (withdrawn + 2)
        return @balance

      else
        puts "Your account is in overdraft, and you cannot have anymore withdrawals."
        return @balance
      end
    end

    def reset_checks
      @check_counter = 0
    end
  end
end
