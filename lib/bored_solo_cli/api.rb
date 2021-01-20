class API

    def self.get_data
        response = RestClient.get('https://www.boredapi.com/api/activity?participants=1')
        activity_hash = JSON.parse(response)

        activity = activity_hash["activity"] 
        type = activity_hash["type"]
        accessibility = activity_hash["accessibility"]
        price = activity_hash["price"]

        SoloActivities.new(activity, type, accessibility, price)
    end
end