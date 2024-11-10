require_relative 'transaction'
require_relative 'transaction_parser'
require_relative 'transaction_sorter'
require_relative 'transaction_processor'

input_file = 'transactions.txt'
output_file = 'sorted_transactions.txt'
processor = TransactionProcessor.new(input_file, output_file)
processor.process
