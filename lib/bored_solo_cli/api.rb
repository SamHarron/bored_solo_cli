class API

    def self.get_data
        response = RestClient.get('https://www.boredapi.com/api/activity?participants=1')
        activity_hash = JSON.parse(response)
    
        SoloActivities.new(activity_hash)
        
    end
end