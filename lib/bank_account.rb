require 'pry'
class BankAccount
  attr_reader :name # Getter method defined
  attr_accessor :balance, :status
  # initialized a bank a account with a name and 1000 value.
  # Set status to "open" and allow to change name.
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end
  # Created a method to allow #deposit of money into the bank account.
  def deposit(deposit_amount)
    self.balance += deposit_amount
  end
  # Can display the bank account balance.
  def display_balance
    "Your balance is $#{balance}."
  end
  # Allow Account to be to close account
  def close_account
    self.status = "closed"
  end
  # Account is valid if status is open and balance is greater than 0.
  def valid?
  balance > 0 && status == "open" 
  end
end
