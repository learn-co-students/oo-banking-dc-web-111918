
require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
    #Transfer.new(amanda, avi, 4000)
  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount

  end

  def valid?
      (self.sender.valid? && self.receiver.valid?) && (self.sender.balance >= self.amount)
  end

  def execute_transaction
    if self.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "Transaction complete."
    else
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      "Original transaction not complete, reversed transaction rejected"

    end
  end


end
