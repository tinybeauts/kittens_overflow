class StoriesController < ApplicationController
  def show
    @story = Story.find_by_id(params[:id])
  end

  def create
    @image = Image.find_by_id(params[:image_id])
    @story = @image.stories.build(params[:story])
    # logger.debug @story
    # @story = Story.new(params[:story])
    # logger.debug @story

    @story.user = current_user
    if @story.save
      flash[:alert] = 'Story submitted.'
      redirect_to image_path(@image)
    else
      render 'images/show'
    end
  end

end
