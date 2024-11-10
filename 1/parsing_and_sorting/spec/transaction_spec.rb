require 'rspec'
require_relative '../transaction'
require_relative '../transaction_parser'
require_relative '../transaction_sorter'

RSpec.describe Transaction do
  it 'initializes correctly' do
    transaction = Transaction.new('2023-09-03T12:45:00Z', 'txn12345', 'user987', '500.25')
    expect(transaction.timestamp).to eq('2023-09-03T12:45:00Z')
    expect(transaction.transaction_id).to eq('txn12345')
    expect(transaction.user_id).to eq('user987')
    expect(transaction.amount).to eq(500.25)
  end
end

RSpec.describe TransactionParser do
  it 'parses a line into a Transaction object' do
    line = '2023-09-03T12:45:00Z,txn12345,user987,500.25'
    transaction = TransactionParser.parse(line)
    expect(transaction.amount).to eq(500.25)
  end
end

RSpec.describe TransactionSorter do
  it 'sorts transactions by amount in descending order' do
    transactions = [
      Transaction.new('2023-09-03T12:45:00Z', 'txn12345', 'user987', '500.25'),
      Transaction.new('2023-09-03T12:46:00Z', 'txn12346', 'user988', '750.00'),
      Transaction.new('2023-09-03T12:47:00Z', 'txn12347', 'user989', '250.75')
    ]

    sorted_transactions = TransactionSorter.sort(transactions)

    expect(sorted_transactions[0].amount).to eq(750.00)
    expect(sorted_transactions[1].amount).to eq(500.25)
    expect(sorted_transactions[2].amount).to eq(250.75)
  end
end
