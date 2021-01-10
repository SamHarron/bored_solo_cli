class SoloActivities

    @@all = []

    attr_accessor :activity #, :type, :accessibility, :price
    
    def initialize(activity) #, type, accessibility, price)
        @activity = activity
       # @type = type
       # @accessibility = accessibility
       # @price = price
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end  

end
