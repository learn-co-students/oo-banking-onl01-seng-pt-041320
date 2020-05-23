class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(cash)
    @balance += cash
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    @status == 'open' && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
    @balance = 0
  end

  def deduct(cash)
    @balance -= cash
  end

end
