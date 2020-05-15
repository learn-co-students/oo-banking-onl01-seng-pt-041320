require 'pry'
class BankAccount
  attr_accessor 
  attr_reader :name, :balance, :status

  def initialize(name)
    @name = name.freeze
    @balance = 1000
    @status = 'open'
  end

  def deposit(money)
   @balance = balance + money
  end







end