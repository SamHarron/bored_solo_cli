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
        puts "  |"
        puts "  |"
        puts "  v"
        puts "#{activity.activity.values[0]}..."
        puts "_____________________________________________________________"
        puts ""
        puts " - This activity is #{activity.activity.values[1]} based."
        puts ""
        accessibility_level
        puts ""
        price_level
    end
        select
    end

    def accessibility_level
        SoloActivities.all.each do |activity|

            if  activity.activity.values[6].between?(0,0.25)
                puts " - This Activity is very possible."
                puts "      Accessibility Rank: #{activity.activity.values[6]} (Ranked 0 to 1)."
            elsif activity.activity.values[6].between?(0.26, 0.5)
                puts " - This Activity is possible."
                puts "      Accessibility Rank: #{activity.activity.values[6]} (Ranked 0 to 1)."
            elsif   activity.activity.values[6].between?(0.51, 0.75)
                puts " - This Activity could be possible."
                puts "      Accessibility Rank: #{activity.activity.values[6]} (Ranked 0 to 1)."
            else
                puts " - This Activity could be possible but it may require other things."
                puts "      Accessibility Rank: #{activity.activity.values[6]} (Ranked 0 to 1)."
            end
        end
    end

    def price_level
        SoloActivities.all.each do |activity|

            if  activity.activity.values[3] == 0
                puts " - This Activity could be/is free!"
                puts "      Accessibility Rank: #{activity.activity.values[3]} (Ranked 0 to 1)."
            elsif activity.activity.values[3].between?(0.01, 0.5)
                puts " - This Activity shouldn't cost very much, but there could be other factors."
                puts "      Accessibility Rank: #{activity.activity.values[3]} (Ranked 0 to 1)."
            else
                puts " - This Activity could be costly and there are likely other factors."
                puts "      Accessibility Rank: #{activity.activity.values[3]} (Ranked 0 to 1)."
            end
        end
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