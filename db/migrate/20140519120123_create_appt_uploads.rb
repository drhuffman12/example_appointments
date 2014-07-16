class CreateApptUploads < ActiveRecord::Migration
  def change
    create_table :appt_uploads do |t|
      t.datetime :process_start_time
      t.datetime :process_end_time
      t.text :content

      t.timestamps
    end
  end
end
