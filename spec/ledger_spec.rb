require 'ledger'

describe Ledger do
  subject(:ledger) { Ledger.new }

  it 'initalizes with empty balance' do
    ledger = Ledger.new
    expect(ledger.balance).to eq 0
  end

  describe '#deposit' do
    it 'increases the balance by the amount (given as argument) deposited' do
      expect { ledger.deposit(10) }.to change { ledger.balance }.by 10
    end
  end

  describe '#withdrawal' do
    it 'decreases the balance by the amount (given as argument) withdrawn' do
      expect { ledger.withdraw(10) }.to change { ledger.balance }.by -10
    end
  end
end
