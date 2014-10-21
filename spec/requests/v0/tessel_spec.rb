require 'rails_helper'

RSpec.describe 'Tessel API', :type => :request  do
	describe 'Registering a tessel' do
		context 'with valid parameters' do
			it 'returns a 201' do
				post '/api/tessel/register'

				expect(response.status).to eq(201)
			end

			it 'creates a Tessel database record' do
				expect {
					post '/api/tessel/register'
				}.to change { Tessel.count }.by(1)
			end

			it 'returns the Tessel device UUID' do
				post '/api/tessel/register'

				expect(response_json['uuid']).to_not be_nil
			end
		end
	end

	describe 'Saving a ping' do
		context 'with valid parameters' do
			let(:tessel_id) { SecureRandom.uuid }
			let(:device_id) { SecureRandom.uuid }

			it 'returns a 201' do
				post_json '/api/tessel/ping', { 'checkin' => {
					'tessel_id' => tessel_id, 
					'device_id' => device_id} 
				}

				expect(response.status).to eq(201)
			end

			it 'creates a check-in database record' do
				expect {
					post_json '/api/tessel/ping', { 'checkin' => {
					'tessel_id' => tessel_id, 
					'device_id' => device_id} 
					}
				}.to change { Checkin.count }.by(1)

				checkin = Checkin.last
				expect(response_json['checkin_id']).to eq(checkin.id)
				expect(response_json['created_at']).to eq(checkin.created_at.iso8601)
			end
		end

		context 'without a Tessel id'
		context 'without a user id'
	end
end