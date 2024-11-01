# date.rb
class Date
  attr_accessor :name, :lastName

  def save
    id = rand(1..1000)
    puts "Saved with id: #{id}, name: #{name}, lastName: #{lastName}"
    Dir.mkdir("./do") unless Dir.exist?("./do")
    File.open("./do/#{id}_#{name}.txt", "w") do |file|
    file.puts "Student id: #{id}"
    
      file.puts "Name: #{name}"
      file.puts "LastName: #{lastName}"
    end
  end

  def all
    files = Dir["./do/*"]
    if files.any?
      files.each do |file|
        file_content = File.readlines(file)
        id = File.basename(file, ".txt")
        name = file_content[0].split(": ")[1].strip
        lastName = file_content[1].split(": ")[1].strip

        result = <<~List
          ID: #{id}
          Name: #{name}
          LastName: #{lastName}
          ===============================
        List
        puts result
      end
    else
      puts "No tasks available."
    end
  end

  def get(id)
    file_path = "./do/#{id}.txt"
    if File.file?(file_path)
      file_content = File.readlines(file_path)
      name = file_content[0].split(": ")[1].strip
      lastName = file_content[1].split(": ")[1].strip
      puts "ID: #{id}\nName: #{name}\nLastName: #{lastName}".colorize(:cyan)
    else
      puts "Task with ID #{id} not found.".colorize(:red)
    end
  end

  def update(id)
    file_path = "./do/#{id}.txt"
    if File.file?(file_path)
      File.open(file_path, "w") do |file|
        file.puts "name: #{name}"
        file.puts "lastName: #{lastName}"
      end
      puts "Updated file with id: #{id}, name: #{name}, lastName: #{lastName}".colorize(:yellow)
    else
      puts "Task with ID #{id} not found.".colorize(:red)
    end
  end

  def delete(id)
    file_path = "./do/#{id}.txt"
    if File.file?(file_path)
      File.delete(file_path)
      puts "Task with ID #{id} deleted successfully.".colorize(:green)
    else
      puts "Task with ID #{id} not found.".colorize(:red)
    end
  end
end
