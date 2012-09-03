class CreateCasestudies < ActiveRecord::Migration
  def change
    create_table :casestudies do |t|
      t.string :title
      t.string :subtitle
      t.string :client
      t.string :category
      t.timestamp :active_time
      t.string :place
      t.string :invitation
      t.text :content
      t.text :photos

      t.timestamps
    end
  end
end
