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
		#@bar = Bar.new(params[:bar])
		@bar = current_user.bars.create!(params[:bar])
		redirect_to @bar, notice: 'Bar was successfully created.'
		#respond_to do |format|
		#	if @bar.save
		#		format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
		#		format.json { render json: @bar, status: :created, location: @bar }
		#	else
		#		format.html { render action: "new" }
		#		format.json { render json: @bar.errors, status: :unprocessable_entity }
		#	end
		#end
	end

	def update
		@bar = Bar.find(params[:id])

		respond_to do |format|
			if @bar.update_attributes(params[:bar])
				format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @bar.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@bar = Bar.find(params[:id])
		@bar.destroy

		respond_to do |format|
			format.html { redirect_to bars_url }
			format.json { head :no_content }
		end
	end
end
