require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # self.receiver.valid? 
    # self.sender.valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount && @status == "pending"
      # binding.pry
      @sender.balance -= @amount
     @receiver.balance += @amount
      @status = "complete" 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @receiver.balance > @amount && self.status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    self.status = "reversed"
    end
  end
end
