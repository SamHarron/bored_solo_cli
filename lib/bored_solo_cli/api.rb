class API

    def self.get_data
        response = RestClient.get('https://www.boredapi.com/api/activity?participants=1')
        activity_array = JSON.parse(response)

        
        activity_key_value = activity_array.values[0]
        type_key_value = activity_array.values[1]
      
        SoloActivities.new(activity_array)

       
    end

    
end