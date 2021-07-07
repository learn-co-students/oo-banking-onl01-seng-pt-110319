class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status 
  
  #can initialize a Transfer
  #initializes with a sender
  #initializes with a receiver 
  #always initializes with a status of 'pending'
  #initializes with a transfer amount 
  
  def initialize (sender,receiver,amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  #can check that both accounts are valid
  #calls on the sender and receiver's #valid? methods
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end 
  end 
  
  #can execute a successful transaction between two accounts
  #each transfer can only happen options_from_collection_for_select
  #rejects a transfer if the sender does not have enough funds (does not have a valid account)
  
def execute_transaction 
    if self.valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  
#can reverse a transfer between two accounts 
#it can only reverse executed transfers 

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end