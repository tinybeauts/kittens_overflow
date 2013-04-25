class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :initialize_new_user


  private


  def initialize_new_user
    @user = User.new unless is_logged_in?
  end
end
