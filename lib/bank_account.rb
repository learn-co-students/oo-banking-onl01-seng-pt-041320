class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount) #method deposits "amount" by adding it to @balance
        @balance += amount
    end

    def display_balance # method just displays @balance
        "Your balance is $#{@balance}."
    end

    def valid? # checking if the account is valid by looking at the status (open) and balance >0
        @status == "open" && @balance > 0
    end

    def close_account # just changing @status to "closed"
        @status = "closed"
    end
end

