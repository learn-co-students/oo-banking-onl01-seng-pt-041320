require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  # initialized with a sender and receiver and can initialize a transfer.
  def initialize(sender, amount, receiver)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  # Can check that both accounts are valid call on the sender and receiver.
  def valid?
    sender.valid? && receiver.valid?
  end
  # can make transaction on both account and transfer only happens once if no enough funds reject transaction.
  def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
      until self.status == "complete"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
      end
    else
      reject_transfer
    end
  end
  # Can undo a tranfer that has already been executed.
  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += aself.mount
      self.status = "reversed"
    end
  end
  # decline the transaction 
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end