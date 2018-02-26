require 'ledger'

describe Ledger do
  let(:transaction) { double :transaction, credit: true }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:ledger) { Ledger.new(transaction_class) }
  TRANSACTION_AMOUNT = 10

  it 'initalizes with empty balance' do
    expect(ledger.balance).to eq 0
  end

  it 'initalizes with an empty transaction list' do
    expect(ledger.transactions).to be_empty
  end

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

  describe '#withdrawal' do
    it 'decreases the balance by the amount (given as argument) withdrawn' do
      expect { ledger.withdraw(TRANSACTION_AMOUNT) }.to change { ledger.balance }.by -TRANSACTION_AMOUNT
    end
  end
end
