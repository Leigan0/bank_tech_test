require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(100) }

  it 'stores a balance given at initialize' do
    expect(transaction.balance).to eq 100
  end

  it 'stores date created' do
    expect(transaction.date_created).to eq Time.now.strftime("%d/%m/%Y")
  end

  it 'defaults to not being a debit transaction' do
    expect(transaction).not_to be_debit
  end

  it 'defaults to not being a credit transaction' do
      expect(transaction).not_to be_credit
  end

  describe '#debit' do
    it 'changes transaction debit status to true' do
      transaction.debit
      expect(transaction).to be_debit
    end
  end

  describe '#credit' do
    it 'changes transaction credit status to true' do
      transaction.credit
      expect(transaction).to be_credit
    end
  end

end
