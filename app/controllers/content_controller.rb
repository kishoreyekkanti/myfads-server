class ContentController < ApplicationController

  def sports_feed
    all_sports_feed = SportsFeed.all
    respond_to do |format|
      format.json {render :json => all_sports_feed.to_json}
    end
  end

end