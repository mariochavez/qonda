class HomeController < ApplicationController
  layout 'application'
  before_filter :authorize
  
  private
  def authorize
    unless logged_in? 
      redirect_to login_path
    end
  end
end