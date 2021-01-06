# You're grabbing all activities that can be done by yourself
# from the Bored API. ** Participants: 1

# What do you want your model object to look like?

class SoloActivities

    @@all = []

    attr_accessor :activity, :type, :accessibility, :price

    # def initialize(activity, type, accessibility, price)
    #     @activity = activity
    #     @type = type
    #     @accessibility = accessibility
    #     @price = price
    #     save
    # end

    def initialize(activity_hash)
        activity_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
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

    # this method accepts the activity's name, and find the object
    # with that name
    
    def self.find_activity(activity_name)
        self.all.find do |x|
            x.activity == activity_name
        end
    
    end
    
    
end
