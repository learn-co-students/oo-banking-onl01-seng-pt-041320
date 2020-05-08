require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  def execute_transaction
    if valid? && @status == "pending" && amount < self.sender.balance
      self.sender.balance -= amount
      self.receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      @status = "reversed"
    end
  end

end
