require 'pry'
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000 
        @status = "open"
        
    end
    
    def self.all
        @@all
    end 

    def deposit(deposit)
        self.balance = self.balance + deposit
    end

    def display_balance 
        "Your balance is $#{@balance}."
    end
    
    

    def valid?
        self.balance > 0 && self.status != "closed" 
    end

    def close_account
        @status = "closed"
    end 
    
    
end
