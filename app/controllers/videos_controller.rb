class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = current_user.videos.build
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to videos_path, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @video.update(video_params)
      redirect_to video_url, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video_link,:cover_image)
  end

  def correct_user
    @video = current_user.videos.find_by(id: params[:id])
    redirect_to videos_path, notice: "Not authorized to edit this Video" if @video.nil?
  end
end