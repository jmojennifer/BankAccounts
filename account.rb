# General comment: would have made consistency/clarity changes if I'd had time

require 'CSV'
require_relative "owner"
module Bank
  class Account
    attr_accessor :id, :balance, :creation_date, :account_owner
    def initialize(id, balance, creation_date)
      @id = id
      @balance = balance.to_f / 100
      @creation_date = creation_date
      @account_owner = account_owner

      if @balance < 0
        raise ArgumentError.new("negative initial balance")
      end
    end

    def current_balance
      puts "Your current balance is $" + sprintf("%0.02f", @balance)
      return @balance
    end

    def withdraw(withdrawn, fee)
      min_withdrawal_threshold = 0

      if @balance - (withdrawn + fee) < min_withdrawal_threshold
        puts "You can't withdraw that much money from this account."
        return @balance
      else
        @balance -= (withdrawn + fee)
        current_balance
        return @balance
      end
    end

    def deposit(deposited)
      @balance += deposited
      current_balance
      return @balance
    end

    def self.all
      account_csv = CSV.read("support/accounts.csv", "r")
      account_list = []

      account_csv.each do |account|
        account_id = account[0].to_i
        account_balance = account[1]
        account_creation_date = account[2]
        account_list.push(self.new(account_id, account_balance, account_creation_date))
      end
      return account_list
    end

    def self.find(id)
      accounts = self.all
      accounts.each do |account|
        if account.id == id
          return account
        end
      end
      puts "That ID is not present."
    end

    # TODO: finish part 2 optional (creating relationship between owner and accounts) for Wave 2
    #       does not quite work as I would have expected
    # def self.add_owner
    #   account_owner_ids = CSV.read("support/account_owners.csv", "r")
    #   account_owner_ids.each do |account_nums|
    #     @account_owner = Bank::Account.find(account_nums[0].to_i).account_owner
    #     @account_owner = Bank::Owner.find(account_nums[1].to_i)
    #     return @account_owner
    #   end
    # end
  end
end
