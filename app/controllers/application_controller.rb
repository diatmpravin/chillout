class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :getActiveBars
  
  #protected

  #def getActiveBars
  #  @bars_all = Bar.find(:all, :order => 'LOWER(name) asc')
  #end
end
