class UsersController < ApplicationController
  layout 'start'
  before_filter :authorize, :only => [:index]
  
  def index
    @user = current_user
    
    respond_to do |format|
      format.html { render :layout => 'application'}# index.html.erb
      format.xml  { render :xml => @profiles }
    end  
  end
  
  def create
    # cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.login ||= @user.email if Tog::Config["plugins.tog_user.email_as_login"]
    
    captcha_validated = Tog::Config["plugins.tog_user.captcha_enabled"] ? verify_recaptcha(@user) : true
    
    # If there is no users yet, set the first one to admin.
    @user.admin = User.find(:all).blank?
    
    @user.register! if captcha_validated && @user.valid?
    if @user.errors.empty?
      redirect_back_or_default(Tog::Config["plugins.tog_user.default_redirect_on_signup"])
      flash[:notice] = I18n.t("tog_user.user.sign_up")
    else
      render :action => 'new'
    end
  end
  
end