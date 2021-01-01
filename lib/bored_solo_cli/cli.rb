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
    end

    def input
        gets.strip
    end


end