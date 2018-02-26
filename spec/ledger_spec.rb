require 'ledger'

describe Ledger do 
  it 'initalizes with empty balance' do
    ledger = Ledger.new
    expect(ledger.balance).to eq 0
  end
end
