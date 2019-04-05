class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t| 
      t.string :workout_type 
      t.integer :reps
      t.integer :sets
      t.integer :weight 
      t.string :time 
      t.string :distance 
      t.string :notes 
      t.integer :user_id 
    end  
  end
end
