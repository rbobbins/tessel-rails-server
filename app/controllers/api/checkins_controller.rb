class Api::CheckinsController < ApplicationController
	def create
		tessel = Tessel.find_by_id(params[:tessel_id])
		if tessel
			checkin = Checkin.create(checkin_params.merge(tessel: tessel))
			render json: checkin.to_json, status: 201
		else
			render json: {}, status: 404
		end
	end

	def index
		tessel = Tessel.find_by_id(params[:tessel_id])
		if tessel
			render json: tessel.checkins.map(&:to_json)
		else
			render json: {}, status: 404
		end
	end

	private
	def checkin_params
		params.require(:checkin).permit(:device_id)
	end
end