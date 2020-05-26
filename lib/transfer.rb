class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end  
  end

  def execute_transaction
    if valid? && self.sender.balance >= self.amount && self.status == "pending"
      self.status = "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
        self.status = "reversed"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
    else
    end
  end 
end
