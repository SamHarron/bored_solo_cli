class CLI 

    def intro
        puts ""
        puts "Being Bored is Boring." 
        puts "Bored Solo CLI can help you find fun activities you can do by yourself!"
        puts ""
        API.get_data
        puts "Let's Begin!"
        puts "Please type in your Name:"
        greet(input)
    end

    def input
        gets.strip
    end

    def greet(name)
        puts "Ok #{name}, let's find you something to do!"
        puts "* Type 'y' to see activities"
        puts "* Type 'exit' if you are no longer bored"
        select
    end

    def random_activity
        SoloActivities.all.each do |activity|
            puts ""
            puts "You Should..."
            puts ""
            puts "#{activity.activity.values[0]}!"
            puts ""
        end
        activity_details
    end



    def goodbye
        puts "Goodbye, We hope your Boredom has been cured!"
    end

    def invalid
        puts "That choice is not valid, please try again."
        select
    end

    def activity_details
        puts "* Type 'info' for more detail or 'n' to get a different activity."

        choice = input
        if choice == "info"
            info
        end
    end

  def info
    SoloActivities.all.each do |activity|
      puts ""
      puts "#{activity.activity.values[0]}"
      puts ""
      puts "Type: #{activity.activity.values[1]}"
      puts ""
      puts "Accessibility: #{activity.activity.values[6]}"
      puts ""
      puts "Price: #{activity.activity.values[3]}"
    end
      select
  end


    def select
        choice = input
        if choice == 'y'
            random_activity
            select
        elsif choice == 'exit'
            goodbye
        else
            invalid
        end
    end
end