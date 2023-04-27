PATH = "info.txt"
RES = "result.txt"


def way
  array = []
  puts "Введите свой возраст:"
  age = ""
  count = 0
  lines = File.foreach(PATH).inject(0) {|c, line| c+1}
  file = File.open(RES, 'a')
  
  while age != "-1" do
    age = gets.chomp
    File.foreach(PATH).with_index do |actor, index|

      if count == lines
        age = "-1"
      end

      if actor.split(' ')[2]  == age and (array.include?(age) == false)
        file.puts(actor)
        count = count + 1
      end 

      if index == lines-1
        array.push(age)
      end

    end
  end

  file.close

end

way
