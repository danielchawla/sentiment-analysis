class Tweet < ActiveRecord::Base

	require 'twitter'
	require 'sentimental'

	def calc_averages (searchterm)

		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "YOUR_CONSUMER_KEY"
			config.consumer_secret     = "YOUR_CONSUMER_SECRET"
			config.access_token        = "YOUR_ACCESS_TOKEN"
			config.access_token_secret = "YOUR_ACCESS_SECRET"
		end

		Sentimental.load_defaults
		analyzer = Sentimental.new
		Sentimental.threshold = 1.0

		sum = 0
		count = 0

		client.search( searchterm , result_type: "recent").take(50).collect do |tweet|
  			if (analyzer.get_score (tweet.text) != 0)
  				sum += analyzer.get_score (tweet.text)
  				count += 1
  			end
  		end

  		(sum/count).round(2)

	end
end
