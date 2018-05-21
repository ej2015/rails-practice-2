class PoliciesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def checks 
		sleep 5
		render json: { success: "well done" }
	end

end
