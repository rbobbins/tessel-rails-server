require 'rails_helper'

RSpec.describe 'Tessel API', :type => :request  do
	describe 'Registering a tessel' do
		it 'always returns a 200' do
			post '/api/tessel/register'

			expect(response).to be_success
			expect(response_json).to eq({})
		end
	end
end