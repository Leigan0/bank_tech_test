require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(100) }

  it 'stores a balance given at initialize' do
    expect(transaction.balance).to eq 100
  end

  it 'stores date created' do
    expect(transaction.date_created).to eq Time.now.strftime("%d/%m/%Y")
  end

end
