PATH = "balance.txt"
$balance = 100.0


def func
  if File.exists?(PATH)
    f = File.open(PATH)
    $balance = f.readlines.to_s[2..-5].to_f
  end
  
  inp = "-"
  puts "
D - deposit
W - withdraw
B - balance
Q - quit
  "
  while inp != "q" do
    inp = gets.chomp.downcase
  
    if inp == "d"
      deposit
    elsif inp == "w"
      withdraw
    elsif inp == "b"
      puts $balance
    elsif inp == "q"
      break
    else
      puts "Неизвестная комманда"
    end
  end
  
  file = File.open(PATH, "w")
  file.puts $balance
  file.close
end


def withdraw
  puts "Введите сумму:"
  num = gets.to_f
  if num < 0 or num > $balance
    puts "Сумма меньше нуля или больше баланса"
  else
    $balance = $balance - num
  end
  puts $balance
end


def deposit
  puts "Введите сумму:"
  num = gets.to_f
  if num < 0
    puts "Число меньше нуля"
  else
    $balance = $balance + num
  end
  puts $balance
end

func
