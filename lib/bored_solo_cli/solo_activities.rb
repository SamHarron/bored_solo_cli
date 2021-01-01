# You're grabbing all activities that can be done by yourself
# from the Bored API. ** Participants: 1

# What do you want your model object to look like?

class SoloActivities

    attr_accessor :activity, :type, :accessibility, :price

    def initialize(activity, type, accessibility, price)
        @activity = activity
        @type = type
        @accessibility = accessibility
        @price = price
    end

end
