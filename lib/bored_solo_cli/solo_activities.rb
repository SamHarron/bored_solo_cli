# You're grabbing all activities that can be done by yourself
# from the Bored API. ** Participants: 1

# What do you want your model object to look like?

class SoloActivities

    @@all = []

    attr_accessor :activity, :type, :accessibility, :price

    def initialize(activity, type, accessibility, price)
        @activity = activity
        @type = type
        @accessibility = accessibility
        @price = price
        save
    end

    # This method is a way to save instances, will get added to @@all
    def save
        @@all << self
    end

    # This method is a way to read your @@all array
    def self.all
        @@all
    end
    
end
