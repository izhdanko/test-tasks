class TransactionParser
  def self.parse(line)
    timestamp, transaction_id, user_id, amount = line.chomp.split(',')
    Transaction.new(timestamp, transaction_id, user_id, amount)
  end
end
