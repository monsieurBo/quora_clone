
class CreateVotesTable < ActiveRecord::Migration[4.2]

  def change
  	create_table :votes do |t|
  	end

  	remove_column :answers, :votes

  	add_reference :votes, :answers
  end

end

