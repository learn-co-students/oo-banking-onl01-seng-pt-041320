require 'pry'

class Transfer
  
   attr_accessor :sender, :receiver, :amount, :status
   attr_reader
  
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    # binding.pry
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if @sender.balance > @amount && @status == "pending" && @sender.valid? && @receiver.valid?
       @receiver.balance += @amount
       @sender.balance -= @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" 
      @sender.balance += @amount 
      @receiver.balance -= @amount
      @status = "reversed"
    # else
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount 
    end

    # binding.pry
  end
end
