class BankAccount
  attr_reader :name
  attr_accessor :balance, :status  
  
  @@all = [ ]
  
  #can initialize a Bank account
  #initializes with a name
  #always initializes with balance of 1000
  #always initializes with a status of 'open'
  #can't change its name 
  
  def initialize(name, balance=1000)
    @name = name 
    @balance = balance
    @status = "open"
    @@all << self 
  end 
  
  #can deposit money into its account 
  
  def deposit(amount)
    @balance += amount 
  end 
  
  #can display its balance 
  
  def display_balance 
    "Your balance is $#{self.balance}."
  end 
  
  #is valid with an open status and a balance greater than 0 
  
  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

#can close its account 

  def close_account
    @status = "closed"
  end

end
  
    
  





