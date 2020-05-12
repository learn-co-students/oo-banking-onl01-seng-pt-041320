require 'pry'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount) # both of these are bank accounts
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end


  def valid? # checks if sender/receiver are valid
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction # 1st param sub, 2nd param add
    # binding.pry
    if @sender.balance > @amount && @sender.status == "open" && @receiver.status == "open" && @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer # amanda 950, avi 1050, @status = "complete"
    if @receiver.balance > @amount && @sender.status == "open" && @receiver.status == "open" && @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
