class Checkin < ActiveRecord::Base
	belongs_to :tessel

	def to_json
		{
			'id' => id,
			'device_id' => device_id,
			'tessel_id' => tessel_id,
			'created_at' => created_at.iso8601
		}
	end
end
