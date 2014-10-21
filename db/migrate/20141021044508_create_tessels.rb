class CreateTessels < ActiveRecord::Migration
  def up
  	enable_extension 'uuid-ossp'

    create_table :tessels, id: :uuid do |t|
      t.timestamps
    end
  end

  def down
  	disable_extension 'uuid-ossp'
  	drop_table :tessels
  end
end
