
class RenameColumns < ActiveRecord::Migration[4.2]

  def change
  	rename_column :answers, :questions_id, :question_id
  	rename_column :votes, :answers_id, :answer_id
  end

end

