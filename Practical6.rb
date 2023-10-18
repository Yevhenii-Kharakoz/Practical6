def valid_ipv4?(str)
  # Розбиваємо строку на частини, використовуючи крапки як роздільник
  parts = str.split('.')

  # Перевіряємо, чи є рівно 4 частини
  return false unless parts.length == 4

  # Перевіряємо кожну частину
  parts.each do |part|
    # Перевіряємо, чи це число
    return false unless part.match?(/^\d+$/)

    # Перевіряємо, чи число лежить в діапазоні від 0 до 255
    num = part.to_i
    return false unless num >= 0 && num <= 255

    # Перевіряємо, що число не починається з нуля (крім нуля самого)
    return false if part.length > 1 && part[0] == '0'
  end

  # Якщо всі перевірки пройдені, повертаємо true
  true
end

# Приклади використання:
puts valid_ipv4?('192.168.1.1') # true
puts valid_ipv4?('0.0.0.0')     # true
puts valid_ipv4?('255.255.255.255') # true
puts valid_ipv4?('256.0.0.0')   # false (число за межами діапазону)
puts valid_ipv4?('00.0.0.0')    # false (ведучі нулі)
puts valid_ipv4?('192.168.1.01') # false (ведучі нулі)
puts valid_ipv4?('192.168.1')    # false (недостатньо частин)
