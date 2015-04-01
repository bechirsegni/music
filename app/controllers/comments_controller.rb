class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]


    def create
      @comment = @video.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
      redirect_to video_path(@video)
      end
    end


  def destroy
    @comment.destroy
    redirect_to video_url(@video)
  end

  private
  def set_comment
    @video = Video.find(params[:video_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to video_path, notice: "Not authorized to destroy this comment" if @comment.nil?
  end
end
