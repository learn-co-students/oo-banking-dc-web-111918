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
      reject_transfer
    end
  end

  def reverse_transfer
    if status == 'complete'
      @sender.deposit(amount)
      @receiver.balance -= amount
      @status = 'reversed'
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = 'rejected'
   "Transaction rejected. Please check your account balance."
  end

end
