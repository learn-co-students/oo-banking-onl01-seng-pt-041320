require 'pry'

class BankAccount
    
    attr_accessor :balance, :status
    attr_reader :name
    
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

    end

    def deposit(amount)
        # can deposit money into its account
        @balance += amount
        # binding.pry
    end

    def display_balance #can display its balance
        "Your balance is $#{@balance}."
        # binding.pry
    end

    def valid? #is valid with an open status and a balance greater than 0
        @status == "open" && @balance > 0
    end

    def close_account #can close its accoun
        @status = "closed"
    end
end
