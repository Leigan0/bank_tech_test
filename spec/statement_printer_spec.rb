require 'statement_printer'

describe StatementPrinter do

  subject(:transaction2) { double :transaction, credit?: false, debit?: true, balance: 125, date_created:"26/02/2018", amount: 25}
  subject(:transaction1) { double :transaction, credit?: true, balance: 150, date_created:"26/02/2018", amount: 50}
  subject(:statement_printer) { described_class.new }

  describe '#header' do
    it 'returns the statement header' do
      expect(statement_printer.header).to eq 'date || credit || debit || balance'
    end
  end

  describe '#transaction_formatter(transactions)' do
    it 'takes array of transactions and returns in statement format' do
      expect(statement_printer.transaction_formatter([transaction1,transaction2])).to eq "26/02/2018 || 50 ||    || 150 \n26/02/2018 ||    || 25 || 125 \n"
    end
  end
end
