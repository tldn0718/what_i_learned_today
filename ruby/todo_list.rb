class ToDoList
  AVAILABLE_COMMANDS = %w[Show Add Delete Exit].freeze

  attr_accessor :todo_list

  def initialize
    @todo_list = []
  end

  def run
    puts "Enter the command among below:"
    puts AVAILABLE_COMMANDS.join(',')
    while (command = gets.chomp.downcase) != 'exit'
      puts
      unless AVAILABLE_COMMANDS.map(&:downcase).include? command
        not_available_command_message
        next
      end
      case command
      when 'show'
        show_current_todo_list
      when 'add'
        puts 'Enter the title of TODO'
        title = gets.chomp
        todo_list << title
        puts "Your TODO(#{title}) is added succesfully."
        show_current_todo_list
      when 'delete'
        show_current_todo_list
        puts "Select TODO to delete by entering number: "
        num_to_delete = gets.chomp.to_i
        while (num_to_delete <= 0) || (num_to_delete > todo_list.size)
          puts "You should enter the integer between 1 and #{todo_list.size}(inclusive)."
          puts "Select TODO to delete by entering number: "
          num_to_delete = gets.chomp.to_i
        end
        deleted = todo_list.delete_at(num_to_delete - 1)
        puts "Your TODO(#{deleted}) is deleted succesfully."
        show_current_todo_list
      else
        not_available_command_message
        next
      end
      puts "Enter the next command: "
    end
  end

  private
  def not_available_command_message
    puts "This command is not valid."
    puts "The available commands are '#{AVAILABLE_COMMANDS.join(', ')}'"
    puts "Enter new commands: "
  end

  def show_current_todo_list
    puts
    if todo_list.empty?
      puts "Your TODO LIST is empty"
      puts
      return
    end
    puts "Your current TODO LIST is"
    todo_list.each_with_index do |todo, i|
      puts "#{i + 1}: #{todo}"
    end
    puts
  end
end

ToDoList.new.run