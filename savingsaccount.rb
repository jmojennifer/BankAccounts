require_relative "Account"
module Bank
  class SavingsAccount < Account

    attr_accessor :account_balance, :id

    def initialize(balance)
      super(id, balance, creation_date)
      @id = rand(111111..999999)
      if @balance < 10.00
        raise ArgumentError.new("invalid initial balance")
      end
    end

    def withdraw(withdrawn, fee)
      super(withdrawn, fee)
      min_withdrawal_threshold = 12.00
      return @balance
    end

    def add_interest(rate)
      interest = @balance * rate / 100
      return interest
    end
  end
end
