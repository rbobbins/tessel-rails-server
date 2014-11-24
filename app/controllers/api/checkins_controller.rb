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
		checkins = Checkin.all
		if params[:tessel_id]
			tessel = Tessel.find_by_id(params[:tessel_id])
			checkins = tessel ? tessel.checkins : []
		end

		render json: checkins.map(&:to_json)
	end

	private
	def checkin_params
		params.require(:checkin).permit(:device_id)
	end
end