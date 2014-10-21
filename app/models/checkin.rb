class Checkin < ActiveRecord::Base
	def to_json
		{
			'checkin_id' => id,
			'created_at' => created_at.iso8601
		}
	end
end
