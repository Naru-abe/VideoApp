class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @video.save
    redirect_to video_path(@video)
  end

  def show
    @video = Video.find(params[:id])
  end

  def index
  end

  def edit
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :video)
  end
end
