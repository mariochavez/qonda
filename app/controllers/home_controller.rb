class HomeController < ApplicationController
  layout 'application'
  before_filter :authorize

end