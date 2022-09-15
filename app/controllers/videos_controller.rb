class VideosController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

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
    @videos = Video.all
  end

  def edit
  end

  def update
    @video.update(video_params)
    redirect_to video_path(@video)
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end


  private

  def video_params
    params.require(:video).permit(:title, :content, :video)
  end

  def correct_user
    @video = Video.find(params[:id])
    unless @video.user_id == current_user.id
      redirect_to videos_path
    end
  end
end
