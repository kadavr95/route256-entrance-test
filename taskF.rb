t = gets.to_i
t.times do
  n = gets.to_i
  ar = []
  values = {}
  n.times do
    s = gets.split(' ')
    if ar == []
      ar = [s[1], s[0], s[2]]
    end
    values.store(s[0], s[1..2])
  end

  (n - 3).times do
    el = ar[-1]
    prev = ar[-2]
    neighbours = values[el]
    nxt = neighbours[0] == prev ? neighbours[1] : neighbours[0]
    ar.push(nxt)
  end

  hl = n / 2
  hl.times do |i|
    puts ar[i] + ' ' + ar[i + hl]
  end
end