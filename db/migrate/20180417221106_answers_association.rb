
class AnswersAssociation < ActiveRecord::Migration[4.2]

  def change
  	add_reference :answers, :questions, :index => true

  end

end

