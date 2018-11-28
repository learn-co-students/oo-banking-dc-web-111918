class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender,@receiver,@amount = sender, receiver, amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending' && @sender.balance > amount
      @receiver.deposit(amount)
      @sender.balance -= amount
      @status = 'complete'
    else
        @status = 'rejected'
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @sender.deposit(amount)
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end
