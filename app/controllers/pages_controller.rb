class PagesController < ApplicationController
  def home
    @user = User.new
    @images = Image.all
  end



end
