PATH = "names.txt"
TEMP = "tmp.txt"

def index
  File.foreach(PATH) {|line| puts line}
end


def find(id)
  result = nil
  file = File.open PATH
  id.times{ result = file.gets }
  puts result
end 


def where(pattern)
  File.foreach(PATH) do |actor|
    if actor.include?(pattern)
      puts actor
    end  
  end
end


def update(id, name)
  file = File.open(TEMP, 'w')
  File.foreach(PATH).with_index do |actor, index|
    file.puts(id == index ? name : actor)
  end
  file.close
  File.write(PATH, File.read(TEMP))
  File.delete(TEMP) if File.exist?(TEMP)
end


def delete(id)
  file = File.open(TEMP, 'w')
  File.foreach(PATH).with_index do |actor, index|
    if id != index
      file.puts actor
    end
  end
  file.close
  File.write(PATH, File.read(TEMP))
  File.delete(TEMP) if File.exist?(TEMP)
end


puts "INDEX"
index
puts "FIND (2)"
find(2)
puts "WHERE ALEX"
where("Alex")
puts "UPDATE (1, DIMA DIMA)"
update(1, "Dima Dima")
puts "DELETE 3"
delete(3)
