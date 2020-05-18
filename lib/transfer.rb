require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bank_account
  

def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
end

def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  binding.pry
  if @sender.valid? == false || @sender.balance < @amount
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  elsif @status == "complete"
    puts "Transaction was already executed"
  else
    @sender.deposit( @amount * -1 ) 
    @receiver.deposit( @amount )
    @status = "complete"
  end
end

def reverse_transfer
  if @status == "complete"
    @sender.deposit( @amount ) 
    @receiver.deposit( @amount * -1)
    @status = "reversed"
  end
end

end

