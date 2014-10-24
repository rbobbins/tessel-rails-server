class Api::CheckinsController < ApplicationController
	def create
		if Tessel.find_by_id(params[:tessel_id])
			checkin = Checkin.new(checkin_params)
			if checkin.save
				render json: checkin.to_json, status: 201
			end
		else
			render json: {}, status: 404
		end

	end

	private
	def checkin_params
		params.require(:checkin).permit(:device_id)
	end
end