
class Transfer
  attr_reader :transfer, :sender, :receiver, :amount
  attr_accessor  :status

 def initialize (sender, receiver, amount)
  @transfer = transfer
  @status = "pending"
  @sender = sender
  @receiver = receiver
  @amount = amount
 end

 def valid?
  if @sender.valid? && @receiver.valid?
    true
  else
      false
end
end

def execute_transaction
  if valid? && sender.balance > @amount && @status =="pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
def reverse_transfer
  if self.execute_transaction
    @receiver.balance = @receiver.balance - @amount
    @sender.balance = @sender.balance + @amount
   @status = "reversed"
end
end
end
