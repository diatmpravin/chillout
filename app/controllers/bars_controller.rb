class BarsController < InheritedResources::Base
	before_filter :authenticate_user!
	
	#def index
  #	@bars = @bars_all
	#end
end
