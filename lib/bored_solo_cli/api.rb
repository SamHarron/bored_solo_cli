class API

    def self.get_data
        response = RestClient.get('https://www.boredapi.com/api/activity?participants=1')
        activity_hash = JSON.parse(response)

        activity_hash["activity"] = activity
        activity_hash["type"] = type
        activity_hash["accessibility"] = accessibility
        activity_hash["price"] = price
        
        SoloActivities.new(activity, type, accessibility, price)
    end
end