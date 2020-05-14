class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @status == "pending" && self.valid? && @sender.balance - @amount > 0
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete" && self.valid? && @receiver.balance - @amount > 0
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      ""
    end
  end
end
