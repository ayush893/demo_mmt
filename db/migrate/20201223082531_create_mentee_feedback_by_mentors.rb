class CreateMenteeFeedbackByMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentee_feedback_by_mentors do |t|
      t.string :mentor_email, null: false, default: ""
      t.string :mentor_name, null: false, default: ""
      t.string :mentee_name, null: false, default: ""
      t.integer :interview_week, null: false, default: 0
      t.integer :interview_duration, null: false, default: 10
      t.string :mentee_performance, null: false, default: ""
      t.integer :mentee_question_solved, null: false, default: 0
      t.text :other_points

      t.timestamps
    end
  end
end
