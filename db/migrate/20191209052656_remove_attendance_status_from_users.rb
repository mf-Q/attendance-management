class RemoveAttendanceStatusFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :attendance_status, :integer
  end
end
