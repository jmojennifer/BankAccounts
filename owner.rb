require 'CSV'
module Bank
  class Owner
    attr_accessor :id, :owner_last_name, :owner_first_name, :owner_street_address, :owner_city, :owner_state

    def initialize(id, owner_last_name, owner_first_name, owner_street_address, owner_city, owner_state)
      @id = id
      @owner_last_name = owner_last_name
      @owner_first_name = owner_first_name
      @owner_street_address = owner_street_address
      @owner_city = owner_city
      @owner_state = owner_state
      # @owner_phone_number = owner_phone_number
      # @owner_email = owner_email
      # get_account_info
    end

    def self.all
      owners_csv = CSV.read("support/owners.csv", "r")
      owners_list = []

      owners_csv.each do |owner|
        id = owner[0].to_i
        owner_last_name = owner[1]
        owner_first_name = owner[2]
        owner_street_address = owner[3]
        owner_city = owner[4]
        owner_state = owner[5]

        owners_list.push(self.new(id, owner_last_name, owner_first_name, owner_street_address, owner_city, owner_state))
      end
      return owners_list
    end

    def self.find(id)
      owners = self.all
      owners.each do |owner|
        if owner.id == id
          puts "Owner #{ owner.owner_first_name } #{ owner.owner_last_name } (\##{ owner.id })"
          return owner
        end
      end
      puts "That ID is not present."
    end

    def get_account_info
      puts "\n\nWhat is the phone number of the primary account holder?"
      @owner_phone_number = gets.chomp
      puts "\n\nWhat is the email of the primary account holder?"
      @owner_email = gets.chomp
    end
  end
end
