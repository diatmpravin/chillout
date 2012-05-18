class ServicesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]
  before_filter :collect_current_user_bars, :only => [:new]
  
	def index
		@services = Service.order_by([[:updated_at, :desc]])
	end

	def show
		@service = Service.find(params[:id])
	end

	def new
		@service = Service.new
	end

  
	def edit
		@service = Service.find(params[:id])
	end

	def create
		@service = Service.new(params[:service])
		if @service.save
			redirect_to @service, notice: 'Service was successfully created.'
		else
			render action: "new"
		end
	end

	def update
		@service = Service.find(params[:id])
		if @service.update_attributes(params[:Service])
			redirect_to @service, notice: 'Service was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@service = Service.find(params[:id])
		@service.destroy
		redirect_to services_path
	end
	
	protected
	
	def collect_current_user_bars
	  @current_user_bars ||= current_user.bars
	end
end
