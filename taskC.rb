t = gets.to_i
t.times do
  puts(gets.gsub('101', 'c').gsub('11', 'd').gsub('100', 'b').gsub('00', 'a'))
end