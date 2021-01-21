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
        puts ""
        puts "Ok #{name}..."
        random_activity
    end

    def random_activity
        SoloActivity.all.each do |activity|
            puts ""
            puts "You Should..."
            puts ""
            puts "#{activity.name}!"
            puts ""
        end
        activity_details
    end

    def goodbye
        puts "Goodbye, We hope your Boredom will be cured!"
        exit!
    end

    def invalid
        puts "That choice is not valid, please try again."
        select
    end

    def activity_details
        puts "* Type 'info' for more details." 
        puts "* Type 'n' to get a different activity."
        puts "* Type 'exit' to exit the application."

        select
    end

    def info
        SoloActivity.all.each do |activity|
        puts "  |"
        puts "  |"
        puts "  v"
        puts "#{activity.name}..."
        puts "_____________________________________________________________"
        puts ""
        puts " - This activity is #{activity.type} based."
        puts ""
        accessibility_level
        puts ""
        price_level
        end
    puts ""
    puts "* Type 'n' to get a new activity."
    puts "* Type 'exit' if you want to do the above activity."
    puts ""
        select
    end

    def accessibility_level
        SoloActivity.all.each do |activity|


            if  activity.accessibility.between?(0,0.25)
                puts " - This Activity is very possible."
                puts "      Accessibility Rank: #{activity.accessibility} (Ranked 0 to 1)."
            elsif activity.accessibility.between?(0.26, 0.5)
                puts " - This Activity is possible."
                puts "      Accessibility Rank: #{activity.accessibility} (Ranked 0 to 1)."
            elsif   activity.accessibility.between?(0.51, 0.75)
                puts " - This Activity could be possible."
                puts "      Accessibility Rank: #{activity.accessibility} (Ranked 0 to 1)."
            else
                puts " - This Activity could be possible but it may require other things."
                puts "      Accessibility Rank: #{al.accessibility} (Ranked 0 to 1)."
            end
        end
    end

    def price_level
        SoloActivity.all.each do |activity|
            if  activity.price == 0
                puts " - This Activity could be/is free!"
                puts "      Price Rank: #{activity.price} (Ranked 0 to 1)."
            elsif activity.price.between?(0.01, 0.5)
                puts " - This Activity shouldn't cost very much, but there could be other factors."
                puts "      Price Rank: #{activity.price} (Ranked 0 to 1)."
            else
                puts " - This Activity could be costly and there are likely other factors."
                puts "      Price Rank: #{activity.price} (Ranked 0 to 1)."
            end
        end
    end

    def select
        choice = input
        if choice == "info"
            info
        elsif choice == 'exit'
            goodbye
        elsif choice == 'n'
            SoloActivity.all.clear
            API.get_data
            random_activity
            select
        else
            invalid
        end
    end
end