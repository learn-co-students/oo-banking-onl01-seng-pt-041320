class Transfer
  # your code here
  attr_accessor :sender, :receiver, :transfer, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else 
      return false
    end
  end

end
