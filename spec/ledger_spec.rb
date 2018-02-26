require 'ledger'

describe Ledger do
  let(:printer) { double :printer, print: '' }
  let(:transaction) { double :transaction, credit: true, debit: true }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:ledger) { Ledger.new(transaction_class, printer) }
  TRANSACTION_AMOUNT = 10

  describe '#deposit' do
    it 'increases the balance by the amount (given as argument) deposited' do
      expect { ledger.deposit(TRANSACTION_AMOUNT) }.to change { ledger.balance }.by TRANSACTION_AMOUNT
    end

    it 'creates a new transaction' do
      ledger.deposit(TRANSACTION_AMOUNT)
      expect(transaction_class).to have_received(:new).with(ledger.balance, TRANSACTION_AMOUNT)
    end

    it 'stores a new transaction' do
      ledger.deposit(TRANSACTION_AMOUNT)
      expect(ledger.transactions).to eq [transaction]
    end
    it 'calls .credit function for transaction' do
      ledger.deposit(TRANSACTION_AMOUNT)
      expect(transaction).to have_received(:credit)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by the amount (given as argument) withdrawn' do
      expect { ledger.withdraw(TRANSACTION_AMOUNT) }.to change { ledger.balance }.by (-TRANSACTION_AMOUNT)
    end
    it 'creates a new transaction' do
      ledger.withdraw(TRANSACTION_AMOUNT)
      expect(transaction_class).to have_received(:new).with(ledger.balance, TRANSACTION_AMOUNT)
    end

    it 'stores a new transaction' do
      ledger.withdraw(TRANSACTION_AMOUNT)
      expect(ledger.transactions).to eq [transaction]
    end
    it 'calls .debit function for transaction' do
      ledger.withdraw(TRANSACTION_AMOUNT)
      expect(transaction).to have_received(:debit)
    end
  end

  describe '#print_statement' do
    it 'calls print on printer object with transactions attribute as arg' do
      ledger.print_statement
      expect(printer).to have_received(:print).with(ledger.transactions)
    end
  end
end
