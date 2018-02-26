class StatementPrinter

  def header
    'date || credit || debit || balance'
  end

  def transaction_formatter(transaction_info)
    statement = ''
    transaction_info.each do |trans|
      if trans.credit?
        statement << "#{trans.date_created} || #{trans.amount} ||    || #{trans.balance} \n"
      else
        statement << "#{trans.date_created} ||    || #{trans.amount} || #{trans.balance} \n"
      end
    end
    statement
  end

end
