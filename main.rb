# main.rb
require "colorize"
require "./date.rb"

def run_program
  text = <<~List
  ---------------------------------
  | 1. Enter "all" to list all tasks |
  | 2. Enter "create" to create tasks |
  | 3. Enter "update" to update tasks |
  | 4. Enter "get" to get tasks      |
  | 5. Enter "delete" to delete tasks |
  ---------------------------------
  List

  puts text
  print "Enter your command: "
  command = gets.chomp.downcase
  puts "\n"

  date = Date.new
  case command
  when "all"
    date.all
  when "create"
    puts "Enter name:"
    date.name = gets.chomp
    puts "Enter lastName:"
    date.lastName = gets.chomp
    date.save
    puts "Task created successfully.".colorize(:green)
  when "update"
    puts "Enter task ID to update:"
    note_id = gets.chomp
    puts "Enter new name for update:"
    date.name = gets.chomp
    puts "Enter new lastName for update:"
    date.lastName = gets.chomp
    date.update(note_id)
  when "get"
    puts "Enter task ID to retrieve:"
    task_id = gets.chomp
    date.get(task_id)
  when "delete"
    puts "Enter task ID to delete:"
    task_id = gets.chomp
    date.delete(task_id)
  else
    puts "Command not found".colorize(:red)
  end
end

run_program
  