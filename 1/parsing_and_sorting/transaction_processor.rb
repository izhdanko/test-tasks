class TransactionProcessor
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def process
    transactions = []

    File.open(@input_file, 'r') do |file|
      file.each_line do |line|
        transactions << TransactionParser.parse(line)
      end
    end

    puts "Парсинг завершен! Обработано #{transactions.size} транзакций."

    sorted_transactions = TransactionSorter.sort(transactions)

    puts "Сортировка завершена! Транзакции отсортированы по сумме."

    File.open(@output_file, 'w') do |file|
      sorted_transactions.each do |transaction|
        file.puts "#{transaction.timestamp},#{transaction.transaction_id},#{transaction.user_id},#{transaction.amount}"
      end
    end

    puts "Результаты записаны в файл '#{@output_file}'."
  end
end
