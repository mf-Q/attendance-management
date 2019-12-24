class AddAttendanceStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :attendance_status, :integer
  end
end
