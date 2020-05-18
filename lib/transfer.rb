require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  # initialized with a sender and receiver and can initialize a transfer.
  def initialize(receiver, sender, amount)
    @sender = receiver
    @receiver = sender 
    @amount = amount 
    @status = "pending"
  end
  # Can check that both accounts are valid call on the sender and receiver.
  def valid?
    sender.valid? && receiver.valid?
  end
  # can make transaction on both account and transfer only happens once if no enough funds reject transaction.
  def execute_transaction
  if valid? && sender.balance > amount && status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else 
      reject_transfer
    end
  end
  # Can undo a tranfer that has already been executed.
  def reverse_transfer
    if receiver.balance > amount && status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
  # Decline the transaction
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end