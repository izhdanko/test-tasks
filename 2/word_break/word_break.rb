require 'set'

def word_break(s, d)
  word_set = d.to_set  # Преобразуем массив слов в множество
  dp = Array.new(s.length + 1, false)
  dp[0] = true  # Пустая строка может быть разбита

  (1..s.length).each do |i|
    (0...i).each do |j|
      if dp[j] && word_set.include?(s[j...i])  # Проверяем, есть ли слово в наборе
        dp[i] = true
        break
      end
    end
  end

  dp[s.length]  # Возврат результата
end

# Пример использования
examples = [
  {
    s: "двесотни",
    d: ["две", "сотни", "тысячи"],
    expected: true
  },
  {
    s: "пятьсотен",
    d: ["пять", "сотен", "миллион"],
    expected: true
  },
  {
    s: "собакаиграет",
    d: ["собака", "играет", "парк"],
    expected: true
  },
  {
    s: "кошки",
    d: ["кошка", "пушистая", "уют"],
    expected: false
  },
  {
    s: "формаинвентарь",
    d: ["форма", "инвентарь", "мячик"],
    expected: true
  },
  {
    s: "высокоедерево",
    d: ["высокое", "дерево", "корень"],
    expected: true
  },
  {
    s: "ромашкивасильки",
    d: ["ромашка", "васильки", "цветы"],
    expected: false
  },
  {
    s: "солнцелуч",
    d: ["солнце", "луч", "вода"],
    expected: true
  },
  {
    s: "программирование",
    d: ["программа", "компьютер", "код"],
    expected: false
  },
  {
    s: "автомобильколесо",
    d: ["автомобиль", "колесо", "двигатель"],
    expected: true
  },
]

examples.each_with_index do |example, index|
  result = word_break(example[:s], example[:d])
  puts "Пример #{index + 1}: строка '#{example[:s]}': ожидание #{example[:expected]}, получено #{result}"
end
