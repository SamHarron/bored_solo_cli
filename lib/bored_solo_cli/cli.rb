# communication between user and data

class CLI 

    #entry way method

    def intro
        puts ""
        puts "Being Bored is Boring." 
        puts "Bored Solo CLI can help you find fun activities you can do by yourself!"
        puts ""
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

    def activities_list
        ["cook", "write", "take a bath", "learn something"].each.with_index(1) do |activity, i|
            puts "#{i}. #{activity}"
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
        puts "Type the Activity Name for more detail."

        choice = input
        puts "#{choice}"
        # SoloActivities.find_activity(choice)
        
    end

    def select
        choice = input


        if choice == 'y'
            activities_list
            puts select
        elsif choice == 'exit'
            goodbye
        else
            invalid
        end
    end
end