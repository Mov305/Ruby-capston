require "./src/app"

def present_options
  puts "
  Choose an option: 
  
  1. List Items
  2. Add a new Book 
  3. Add a new Music album 
  4. Add a new Movie 
  5. Add a new Game 
  6. Add a new Label
  7. Exit"
end

class Main
  def initialize
    @app = App.new
  end

  def run
    puts "Welcome to the Catalog App!"
    shutdown = false
    while (!shutdown)
      present_options
      option = gets.chomp.to_i
      # handle option
      if option.between?(1, 7)
        shutdown = @app.main_processor(option)
      else
        puts "Invalid option"
      end
      sleep(0.5)
    end

    puts "Thank you for using the Catalogue!"
  end
end

main = Main.new.run
