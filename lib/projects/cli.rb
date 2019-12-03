class Projects::CLI

    def call
        greetings
        lists_stuff
        menu
        goodbye
    end
    def greetings # what the user first sees.....!

      puts "welcome to the world of the unknown"
    end

    def lists_stuff  #what the user can pick from

        @unknown = Projects::Unknown.today
        @unknown.each.with_index(1) do |unknown, i|
            puts "#{i}. #{unknown.name} - #{unknown.description} - #{unknown.url}"
        end
    end
    def menu  #interface that takes users input and returns something
        puts "enter the number for the unknown item or type list to see the menu again or type exit to leave:"   #let user know to interact using an integer
        input = nil
        while input != "exit"
          input = gets.chomp!

          if input.to_i > 0
            unknown = @unknown[input.to_i-1]
            puts "#{unknown.name} - #{unknown.description} - #{unknown.url}"
          elsif input == "list"
            greetings
            lists_stuff
            menu
          else
            puts " or type list to see the menu again or type exit to leave:"
          end

            def goodbye
                puts "Goodbye"
            end
        end
    end
end