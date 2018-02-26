require 'date'

class Transaction
  attr_reader :balance, :date_created

  def initialize(balance)
    @balance = 100
    @date_created = date
    @debit = false
  end

  def debit
    @debit = true 
  end

  def debit?
    @debit
  end

private
  def date
    Time.now.strftime("%d/%m/%Y")
  end
end
