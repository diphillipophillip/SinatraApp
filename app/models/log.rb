class Log < ActiveRecord::Base 
    belongs_to :user 
    validate :info_given_in_log 
    validates :workout_type, presence: true 
    validates :date, presence: true

    def info_given_in_log
        if reps.blank? && sets.blank? && weight.blank? && time.blank? && distance.blank? && notes.blank? 
            errors.add(:notes, "Please fill in one of these fields: (Reps, Sets, Weights, Time, Notes)")
        end 
    end 


end 



# t.string :workout_type 
# t.integer :reps
# t.integer :sets
# t.integer :weight 
# t.string :time 
# t.string :distance 
# t.string :notes 
# t.integer :user_id 