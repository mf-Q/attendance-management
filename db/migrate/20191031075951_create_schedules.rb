class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.time        :in,     null: false
      t.time        :out    
      t.references  :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
