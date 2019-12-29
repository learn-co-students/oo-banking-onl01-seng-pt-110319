require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :transfer, :amount, :status
  
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
      if self.valid? == false || @sender.balance < amount
        @status = "rejected"
          "Transaction rejected. Please check your account balance."
      elsif 
        @status != "complete"
          @sender.balance -= amount
          @receiver.balance += amount
          @status = "complete"
      end
  end
  
  def reverse_transfer
    
  end
end
