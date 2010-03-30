module InternationalizationSystem
  protected
  
  def current_user_locale
    @current_user_locale ||= locale_from_settings || locale_from_session || locale_from_cookie || locale_from_browser
  end

end