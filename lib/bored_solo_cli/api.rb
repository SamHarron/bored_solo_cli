

class API

    def self.get_data
        response = RestClient.get('https://www.boredapi.com/api/activity?participants=1')
        activity_array = JSON.parse(response)["activity"]
        activity_array.each do |activity|
            SoloActivities.new(activity)
    end
end
