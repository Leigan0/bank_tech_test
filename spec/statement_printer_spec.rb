require 'statement_printer'

describe StatementPrinter do
  subject(:transaction2) { double :transaction, credit?: false, debit?: true, balance: 125, date_created: '26/02/2018', amount: 25 }
  subject(:transaction1) { double :transaction, credit?: true, balance: 150, date_created: '26/02/2018', amount: 50 }

  subject(:statement_printer) { described_class.new }

  describe '#print((transactions)' do
    it 'returns formatted statement print out' do
      expect(statement_printer.print([transaction1, transaction2])).to eq "date || credit || debit || balance\n26/02/2018 ||    || 25 || 125 \n26/02/2018 || 50 ||    || 150 \n"
    end
  end
end
