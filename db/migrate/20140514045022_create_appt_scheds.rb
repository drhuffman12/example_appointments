class CreateApptScheds < ActiveRecord::Migration
  def change
    create_table :appt_scheds do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :first_name
      t.string :last_name
      t.string :comments

      t.timestamps
    end
  end
end
