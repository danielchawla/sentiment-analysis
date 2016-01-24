class Main < ActiveRecord::Base
	def self.getTweets

		client.search("marry me", :result_type => "recent").take(10).collect do |tweet|
  			"#{tweet.user.screen_name}: #{tweet.text}"
		end
		response = RestClient.get "https://api.whitehouse.gov/v1/petitions.json?limit=5"
		parsed_response = JSON.parse(response)
		petitions = parsed_response["results"]
  	end
end
