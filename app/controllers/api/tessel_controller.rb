class Api::TesselController < ApplicationController
	def register
		tessel = Tessel.new
		if tessel.save
			render json: { 'uuid' => tessel.id }, status: 201
		end
	end

	def ping
		checkin = Checkin.new(checkin_params)
		if checkin.save
			render json: checkin.to_json, status: 201
		end
	end

	private
	def checkin_params
		params.require(:checkin).permit(:device_id, :tessel_id)
	end
end