class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :casestudy_id
      t.string :path
      t.string :description
      t.string :ext
      t.string :stauts

      t.timestamps
    end
  end
end
