class ServicesController < InheritedResources::Base
	before_filter :authenticate_user!, :except => [:index]
  
	def index
		@services = Service.all
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
		@service = Service.new(params[:Service])

		respond_to do |format|
			if @service.save
				format.html { redirect_to @service, notice: 'Service was successfully created.' }
				format.json { render json: @service, status: :created, location: @service }
			else
				format.html { render action: "new" }
				format.json { render json: @service.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@service = Service.find(params[:id])

		respond_to do |format|
			if @service.update_attributes(params[:Service])
				format.html { redirect_to @service, notice: 'Service was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @service.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@service = Service.find(params[:id])
		@service.destroy
	end
end
