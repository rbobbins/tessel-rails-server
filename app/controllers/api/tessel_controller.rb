class Api::TesselController < ApplicationController
	def register
		tessel = Tessel.new
		if tessel.save
			render json: { 'uuid' => tessel.id }, status: 201
		end
	end
end