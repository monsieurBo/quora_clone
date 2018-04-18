
class VotesColumn < ActiveRecord::Migration[4.2]

  def change
  	add_column :answers, :votes, :string
  end

end

