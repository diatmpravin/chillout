class BarsController < ApplicationController

	before_filter :authenticate_user!
  
	def index
		@bars = Bar.all
	end
	
	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def create
		@bar = current_user.bars.create!(params[:bar])
		redirect_to @bar, notice: 'Bar was successfully created.'
	end

	def update
		@bar = Bar.find(params[:id])
		if @bar.update_attributes(params[:bar])
			format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
			format.json { head :no_content }
		else
			format.html { render action: "edit" }
			format.json { render json: @bar.errors, status: :unprocessable_entity }
		end
	end

	def destroy
		@bar = Bar.find(params[:id])
		@bar.destroy
		redirect_to bars_path
	end
end
