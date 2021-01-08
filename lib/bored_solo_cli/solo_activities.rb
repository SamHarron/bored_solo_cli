class SoloActivities

    @@all = []

    attr_accessor :activity, :type, :accessibility, :price

    def initialize(activity)
        @activity = activity
        @type = type
        @accessibility = accessibility
        @price = price
        save
    end

    # def initialize(activity_hash)
    #     activity_hash.each do |k, v|
    #         self.send("#{k}=", v) if self.respond_to?("#{k}=")
    #     end
    #     save
    # end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
  
    def self.find_activity(activity_name)
        self.all.find do |activity|
            activity.activity == activity_name
        end
    
    end
    
    
end
