class HomeController < ApplicationController
  def index
    @tweets = Tweet.most_recent.published
  end
end
