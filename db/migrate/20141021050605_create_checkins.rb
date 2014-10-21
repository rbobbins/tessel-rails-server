class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins, id: :uuid do |t|
    	t.uuid :tessel_id
    	t.uuid :device_id
    	
	    t.timestamps
    end
  end
end
