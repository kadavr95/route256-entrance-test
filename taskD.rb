t = gets.to_i
t.times do
  found = false
  n = gets.to_i
  s = gets.split(' ')
  n.times do |l|
    l.times do |i|
      if s[i..i + n - l].uniq.length <= 2
        puts(n - l + 1)
        found = true
        break
      end
    end
    break if found
  end
  puts 1 unless found
end