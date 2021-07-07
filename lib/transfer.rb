class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :transfer_amount
  
  
    def initialize(sender, receiver, transfer_amount)
      @transfer = transfer_amount
      @amount = transfer_amount
      @sender = sender
      @receiver = receiver
      @transfer_amount = (50)
      @status = ("pending") 
    end

    def valid?()
      @sender.valid? && @receiver.valid? ? true : false
    end

    def execute_transaction
      if @sender.balance > @amount && @status == ("pending") && valid? 
         @sender.balance -= @amount
         @receiver.balance += @amount
         @status = ("complete")
      else
      
         self.status = ("rejected")
        return  ("Transaction rejected. Please check your account balance.") 
      end
    end

    def reverse_transfer()
      if @status == ("complete")
         @sender.balance += @amount
         @receiver.balance -= @amount
         @status = ("reversed")
      end
    end
end
