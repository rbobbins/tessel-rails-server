require 'rails_helper'

RSpec.describe "Reuqesting info about a Tessel device's checkins", :type => :request  do
	describe 'Checking in at a Tessel' do
		let(:device_id) { SecureRandom.uuid }

		context 'with valid parameters' do
			let!(:tessel_id) { Tessel.create.id }

			it 'returns a 201' do
				post_json "/api/tessels/#{tessel_id}/checkins", { 'checkin' => {
					'device_id' => device_id} 
				}

				expect(response.status).to eq(201)
			end

			it 'creates a check-in database record' do
				expect {
					post_json "/api/tessels/#{tessel_id}/checkins", { 'checkin' => {
						'device_id' => device_id} 
					}
				}.to change { Checkin.count }.by(1)

				checkin = Checkin.last
				expect(response_json).to eq({	'created_at' => checkin.created_at.iso8601,
												'device_id' => device_id,
												'tessel_id' => tessel_id,
												'id' => checkin.id })
			end
		end

		context 'with an invalid Tessel id' do
			let(:tessel_id) { SecureRandom.uuid }

			it 'returns a 404' do
				post_json "/api/tessels/#{tessel_id}/checkins", { 'checkin' => {
					'device_id' => device_id} 
				}

				expect(response.status).to eq(404)
			end

			it 'does not log the check in' do
				expect {
					post_json "/api/tessels/#{tessel_id}/checkins", { 'checkin' => {
						'device_id' => device_id} 
					}
				}.to_not change { Checkin.count }
			end
		end
	end
	
	describe 'Viewing a list of checkins to a tessel' do
		context 'with a valid Tessel id' do
			let!(:tessel) { Tessel.create }
			let(:device_id)  { SecureRandom.uuid }
			let!(:checkin) { Checkin.create(tessel: tessel, device_id: device_id) }

			it 'should return a 200 status' do
				get "api/tessels/#{tessel.id}/checkins"
				expect(response.status).to eq(200)
			end

			it 'should return a list of checkin times with device ids' do
				get "api/tessels/#{tessel.id}/checkins"
				expect(response_json).to eq([{	'created_at' => checkin.created_at.iso8601,
												'device_id' => device_id,
												'tessel_id' => tessel.id,
												'id' => checkin.id }
											])
			end
		end
		context 'with an unknown Tessel id' do
			let!(:tessel_id) { SecureRandom.uuid }

			it 'should return an empty list' do
				get "api/tessels/#{tessel_id}/checkins"
				expect(response.status).to eq(200)
				expect(response_json).to eq([])
			end
		end
	end

	describe 'Viewing all checkins, regardless of tessel' do
		let(:device_id)  { SecureRandom.uuid }

		let!(:tessel1) { Tessel.create }
		let!(:tessel2) { Tessel.create }
		let!(:checkin1) { Checkin.create(tessel: tessel1, device_id: device_id) }
		let!(:checkin2) { Checkin.create(tessel: tessel2, device_id: device_id) }

		it 'should return a 200 status' do
			get "api/checkins"
			expect(response.status).to eq(200)
		end

		it 'should return a list of checkin times with device ids' do
			get "api/checkins"
			expect(response_json).to eq([{	'created_at' => checkin1.created_at.iso8601,
											'device_id' => device_id,
											'tessel_id' => tessel1.id,
											'id' => checkin1.id },
										{	'created_at' => checkin2.created_at.iso8601,
											'device_id' => device_id,
											'tessel_id' => tessel2.id,
											'id' => checkin2.id }
										])
		end
	end
end