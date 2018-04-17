class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.string :address
      t.string :zip_code
      t.integer :skill_level
      t.integer :organizer_id

      t.timestamps null: false
    end
  end
end
