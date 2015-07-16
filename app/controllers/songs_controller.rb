class SongsController < ApplicationController
  before_filter :set_song, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:category].blank?
      @songs = Song.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @songs = Song.where(category_id: @category_id ).order("created_at DESC")
    end
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
    if @song.update(song_params)
      redirect_to song_path ,notice: 'song updated succesfully'
    else
      render :edit
    end
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
    params.require(:song).permit(:title, :description, :mp3, :image, :category_id)
  end

  def correct_user
    @song = current_user.songs.find_by(id: params[:id])
    redirect_to songs_path, notice: "Not authorized to edit this Song" if @song.nil?
  end

end