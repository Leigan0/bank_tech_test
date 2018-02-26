require 'date'

class Transaction
  attr_reader :balance, :date_created, :amount

  def initialize(balance, amount)
    @balance = 100
    @date_created = date
    @debit = false
    @credit = false
    @amount = amount
  end

  def debit
    @debit = true
  end

  def credit
    @credit = true
  end

  def debit?
    @debit
  end

  def credit?
    @credit
  end

private
  def date
    Time.now.strftime("%d/%m/%Y")
  end
end
