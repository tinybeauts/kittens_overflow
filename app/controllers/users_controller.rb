class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:alert] = 'Success!'
      login(@user)
      redirect_to root_path
    else
      @images = Image.all
      render 'pages/home'
    end
  end

  
end
