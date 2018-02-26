require 'transaction'

describe Transaction do
  it 'stores a balance given at initialize' do
    transaction = Transaction.new(100)
    expect(transaction.balance).to eq 100
  end

end
