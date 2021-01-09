class SoloActivities

    @@all = []

    attr_accessor :activity

    def initialize(activity)
        @activity = activity
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end  

end
