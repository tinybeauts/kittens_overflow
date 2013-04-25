class ImagesController < ApplicationController
  def show
    @image = Image.find_by_id(params[:id])
    @story = Story.new#(:image_id => @image.id)#@image.stories.build
  end

end
