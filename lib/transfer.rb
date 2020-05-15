class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @status = "pending" 
    @receiver = receiver
    @sender = sender 
    @amount = amount 
  end
  
  def valid? 
    @sender.valid? && @receiver.valid? ? true : false 
  end 
  
  def execute_transaction 
    if @sender.balance > @amount && self.valid? && @status =="pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
    else @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
    
end
