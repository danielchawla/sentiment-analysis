class TweetController < ApplicationController

	def create
		
	end


  def calculate_avgs
  	t = Tweet.create
  	t.sentiment = t.calculate_avgs (params[:searchterm])
  	t.save
  	redirect_to "/tweets/#{t.id}"
  end

end
