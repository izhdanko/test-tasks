class TransactionSorter
  def self.sort(transactions)
    quicksort(transactions)
  end

  private

  def self.quicksort(array)
    return array if array.length <= 1

    pivot = array.delete_at(array.length / 2)
    left = array.select { |transaction| transaction.amount > pivot.amount }
    right = array.select { |transaction| transaction.amount <= pivot.amount }

    quicksort(left) + [pivot] + quicksort(right)
  end
end
