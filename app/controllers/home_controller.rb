class HomeController < ApplicationController
  def index
    @songs = Song.all
    @videos = Video.all
  end
end
