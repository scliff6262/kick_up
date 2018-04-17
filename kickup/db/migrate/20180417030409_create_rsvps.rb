class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.text :comment
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
