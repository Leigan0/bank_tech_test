class StatementPrinter

  def print(transaction_info)
    header + transaction_formatter(transaction_info)
  end

  private

  def header
    "date || credit || debit || balance\n"
  end

  def transaction_formatter(transaction_info)
    statement = ''
    transaction_info.reverse.each do |trans|
      if trans.credit?
        statement << "#{trans.date_created} || #{trans.amount} ||    || #{trans.balance} \n"
      else
        statement << "#{trans.date_created} ||    || #{trans.amount} || #{trans.balance} \n"
      end
    end
    statement
  end

end
