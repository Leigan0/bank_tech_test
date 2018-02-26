class Ledger
  require_relative 'transaction'

  attr_reader :balance, :transactions
  def initialize(transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount)
    transactions.last.credit
  end

  def withdraw(amount)
    @balance -= amount
  end

private
  def add_transaction(amount)
    transaction = @transaction_class.new(balance, amount)
    @transactions << transaction
  end
end
