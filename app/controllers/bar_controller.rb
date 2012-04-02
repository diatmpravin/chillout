class BarController < ApplicationController

  before_filter :authenticate_user!  
  
  def new
    @bar = Bar.new
  end
  
  def create
    @bar = Bar.create!(params[:bar])
    redirect_to  bars_path
  end
  
  def index
  end
  
end
