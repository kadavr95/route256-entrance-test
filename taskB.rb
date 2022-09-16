require 'date'
t = gets.to_i
t.times do
  d = gets.gsub(' ', '/')
  begin
    DateTime.parse(d)
    puts('YES')
  rescue
    puts('NO')
  end
end