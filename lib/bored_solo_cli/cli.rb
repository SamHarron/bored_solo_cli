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
        SoloActivities.all.map do |rm|
            puts ""
            puts "You Should..."
            puts ""
            puts "#{rm.activity.values[0]}!"
            puts ""
        end
        activity_details
    end

    def goodbye
        puts "Goodbye, We hope your Boredom will be cured!"
        exit
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
        SoloActivities.all.map do |i|
        puts "  |"
        puts "  |"
        puts "  v"
        puts "#{i.activity.values[0]}..."
        puts "_____________________________________________________________"
        puts ""
        puts " - This activity is #{i.activity.values[1]} based."
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
        SoloActivities.all.map do |al|

            if  al.activity.values[6].between?(0,0.25)
                puts " - This Activity is very possible."
                puts "      Accessibility Rank: #{al.activity.values[6]} (Ranked 0 to 1)."
            elsif al.activity.values[6].between?(0.26, 0.5)
                puts " - This Activity is possible."
                puts "      Accessibility Rank: #{al.activity.values[6]} (Ranked 0 to 1)."
            elsif   al.activity.values[6].between?(0.51, 0.75)
                puts " - This Activity could be possible."
                puts "      Accessibility Rank: #{al.activity.values[6]} (Ranked 0 to 1)."
            else
                puts " - This Activity could be possible but it may require other things."
                puts "      Accessibility Rank: #{al.activity.values[6]} (Ranked 0 to 1)."
            end
        end
    end

    def price_level
        SoloActivities.all.map do |pl|

            if  pl.activity.values[3] == 0
                puts " - This Activity could be/is free!"
                puts "      Price Rank: #{pl.activity.values[3]} (Ranked 0 to 1)."
            elsif pl.activity.values[3].between?(0.01, 0.5)
                puts " - This Activity shouldn't cost very much, but there could be other factors."
                puts "      Price Rank: #{pl.activity.values[3]} (Ranked 0 to 1)."
            else
                puts " - This Activity could be costly and there are likely other factors."
                puts "      Price Rank: #{pl.activity.values[3]} (Ranked 0 to 1)."
            end
        end
    end

    def select
        choice = input
        if choice == 'y'
            random_activity
            select
        elsif choice == "info"
            info
        elsif choice == 'exit'
            goodbye
        elsif choice == 'n'
            SoloActivities.all.clear
            API.get_data
            random_activity
            select
        else
            invalid
        end
    end
end