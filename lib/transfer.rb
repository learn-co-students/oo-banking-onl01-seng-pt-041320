class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  # - 1st try
  def valid?
   @sender.valid? && @receiver.valid? == true || false
  end

# - 2nd try
  # def valid?
  # if @sender.valid? && @receiver.valid? 
  #   true
  # else
  # false

# -- spec file ----

  # it "can execute a successful transaction between two accounts" do
  #   transfer.execute_transaction
  #   expect(amanda.balance).to eq(950)
  #   expect(avi.balance).to eq(1050)
  #   expect(transfer.status).to eq("complete")
  # end

  # expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
  #     expect(bad_transfer.status).to eq("rejected")
  
  def valid?
    @receiver.valid? && @sender.valid? 
  end 

  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount  
      @sender.balance -= @amount
      @receiver.balance += @amount
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
    end 
  end 
 
end