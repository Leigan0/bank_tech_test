class Ledger
  require_relative 'transaction'
  require_relative 'statement_printer'

  attr_reader :balance, :transactions

  def initialize(transaction_class = Transaction, printer = StatementPrinter.new)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
    @statement_printer = printer
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount)
    current_transaction.credit
  end

  def withdraw(amount)
    @balance -= amount
    add_transaction(amount)
    current_transaction.debit
  end

  def print_statement
    puts @statement_printer.print(transactions)
  end

  private

  attr_reader :current_transaction

  def add_transaction(amount)
    @current_transaction = @transaction_class.new(balance, amount)
    @transactions << current_transaction
  end
end
