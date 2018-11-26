require "pry"
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(cash)
    self.balance += cash
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    return self.balance > 0 && self.status == "open"
    #binding.pry
  end

  def close_account
    self.status = "closed"
  end

end
