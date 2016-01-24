class Tweet < ActiveRecord::Base

	require 'twitter'
	require 'sentimental'


	def calc_averages (tweet)
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "qKxdvu4yXacwN6DtUEubaZUwo"
		  config.consumer_secret     = "zKhyO6Pj4BX64nv4kjRE1i9iFlPbfPHyTbRJ5StUlD1mBuFKrq"
		  config.access_token        = "129998888-So1iVy5THRkhRKn08tyAGhjCXgJcHvCG8I2IbyET"
		  config.access_token_secret = "VDhFQWQVIm2pYlXdvbXMUWA4bi7Oj4GgPQYWyFJxurCag"
		end

		Sentimental.load_defaults
		analyzer = Sentimental.new

		sum = 0
		count = 0
		client.search(tweet, result_type: "recent").take(10).collect do |tweet|
  			sum += analyzer.get_score (tweet.text)
  			count += 1
  		end

  		p sum/count

	end
end
