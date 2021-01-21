class SoloActivity

    @@all = []

    attr_accessor :name, :type, :accessibility, :price 
    
    def initialize(name, type, accessibility, price) 
        @name = name
        @type = type
        @accessibility = accessibility
        @price = price
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end  
end
