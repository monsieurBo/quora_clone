
class ChangeQuestionType < ActiveRecord::Migration[4.2]

  def change
  	change_column :questions, :question, :string
  end

end

