require 'money'
require 'CSV'
module Bank


  class Account
    attr_accessor :id, :balance, :creation_date
    def initialize(id, balance, creation_date)
      @balance = balance
      @id = id
      @creation_date = creation_date
      #@account_owner = Bank::Owner.new(account_owner_name)
    end

    def self.all
      account_csv = CSV.read("support/accounts.csv", "r")
      account_list = []

      account_csv.each do |account|
        account_id = account[0].to_i
        account_balance = account[1]
        account_creation_date = account[2]

        if Money.new(account_balance * 100, "USD") < Money.new(0, "USD")
          raise ArgumentError.new("negative initial balance")
        else
          account_list.push(self.new(account_id, Money.new(account_balance.to_f * 100, "USD"), account_creation_date))
        end
      end
      return account_list
    end

    def self.find(id)
      accounts = self.all
      accounts.each do |account|
        if account.id == id
          puts "Account \##{ account.id }: Current Balance: $#{ account.balance }"
          return account
        end
      end
      puts "That ID is not present."
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
