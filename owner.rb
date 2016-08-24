# to-do: make Owner class and interact with Account class
module Bank
  class Owner
    attr_accessor :account_primary_name, :account_primary_address, :account_primary_phone_number, :account_primary_email

    def initialize(account_primary_name)
      @account_primary_name = account_primary_name
      @account_primary_address = account_primary_address
      @account_primary_phone_number = account_primary_phone_number
      @account_primary_email = account_primary_email
      get_account_info
    end

    def get_account_info
      puts "\n\nWhat is the address of the primary account holder?"
      @account_primary_address = gets.chomp
      puts "\n\nWhat is the phone number of the primary account holder?"
      @account_primary_phone_number = gets.chomp
      puts "\n\nWhat is the email of the primary account holder?"
      @account_primary_email = gets.chomp
    end
  end
end
