require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
    #binding.pry
  end

  def execute_transaction
    if self.sender.balance > self.amount && self.status == "pending" && self.receiver.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      #binding.pry
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
      #binding.pry
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
    end
  end
end
