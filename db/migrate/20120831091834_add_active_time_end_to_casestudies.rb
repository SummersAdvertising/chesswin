class AddActiveTimeEndToCasestudies < ActiveRecord::Migration
  def change
  	add_column :casestudies, :active_time_end, :timestamp
  end
end
