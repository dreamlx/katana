class CreateJobCodes < ActiveRecord::Migration
  def change
    create_table :job_codes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
