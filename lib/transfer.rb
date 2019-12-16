require 'pry'

class Transfer

  attr_accessor :status, :sender, :receiver, :amount
  #attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" && self.valid?
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




# if valid? && @status == "complete"
#   "Transaction already complete"
# elsif @sender.balance > @amount && status == "pending"
#   @receiver.balance += @amount
#   @sender.balance -= @amount
#   @status = "complete"
# else @sender.balance < @amount
#   @status = "rejected"
#   "Transaction rejected. Please check your account balance."
# end
