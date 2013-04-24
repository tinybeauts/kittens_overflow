class SessionsController < ApplicationController
  
  def create
    @user = User.find_by_email(params[:login][:email])
                .try(:authenticate, params[:login][:password])
    if @user
      flash[:alert] = "Welcome #{@user.username}"
      login(@user)
      redirect_to root_path
    else
      flash.now[:error] = "Login failed"
      @user = User.new
      render 'pages/home'
    end
  end

  def destroy
    logout
    flash[:alert] = "Logged out"
    redirect_to root_path
  end

end
