class TweetController < ApplicationController

	def create
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def calculate_avgs
		t = Tweet.create
		t.sentiment = t.calc_averages (params[:search])
		t.save
		redirect_to "/tweet/#{t.id}"
	end

end
