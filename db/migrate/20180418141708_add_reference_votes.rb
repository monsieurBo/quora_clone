
class AddReferenceVotes < ActiveRecord::Migration[4.2]

  def change
  	remove_column :votes, :answers_id
  	add_reference :votes, :answers, :index => true
  end

end

