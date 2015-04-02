class SongsController < ApplicationController
  before_filter :set_song, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end


  def new
    @song = current_user.songs.build
  end

  def create
    @song = current_user.songs.build(song_params)
    if @song.save
      redirect_to songs_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @song.update
    redirect_to song_path

  end

  def destroy
    @song.destroy
    redirect_to root_path
  end


  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :description, :mp3, :image)
  end

  def correct_user
    @song = current_user.songs.find_by(id: params[:id])
    redirect_to songs_path, notice: "Not authorized to edit this Song" if @song.nil?
  end

end