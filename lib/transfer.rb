'require pry'

class Transfer

attr_accessor :amount, :status
attr_reader :sender, :receiver

  def initialize(sender, receiver, amount=50)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
  end

  def valid?
    self.sender.balance >= self.amount
    self.receiver.status == "open"
    self.sender.status == "open"
    self.sender.valid?
    self.receiver.valid?
    #binding.pry
  end


  def execute_transaction
    if self.status == "pending"
        if  self.sender.valid? && self.sender.balance >= self.amount && self.receiver.valid?
         self.sender.balance -= self.amount
         self.receiver.balance += self.amount
         self.status = "complete"
       else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
       end
      else
      
    end

  end

  def reverse_transfer
  end



end
     # your code here
