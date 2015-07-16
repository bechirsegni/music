class ScommentsController < ApplicationController
  before_action :set_scomment, only: [:create, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]


  def create
    @scomment = @song.scomments.build(scomment_params)
    @scomment.user = current_user
    if @scomment.save
      redirect_to song_path(@song)
    end
  end


  def destroy
    @scomment.destroy
    redirect_to song_url(@song)
  end

  private
  def set_scomment
    @song = Song.find(params[:song_id])
  end

  def scomment_params
    params.require(:scomment).permit(:body)
  end

  def correct_user
    @scomment = current_user.scomments.find_by(id: params[:id])
    redirect_to song_path, notice: "Not authorized to destroy this comment" if @scomment.nil?
  end
end