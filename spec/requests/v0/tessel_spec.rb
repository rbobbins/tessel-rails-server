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
end