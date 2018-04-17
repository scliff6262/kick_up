class ChangeTimeToTime < ActiveRecord::Migration
  def change
    change_column :events, :time, :time
  end
end
