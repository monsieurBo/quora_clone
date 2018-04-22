
class ReferenceUserVote < ActiveRecord::Migration[4.2]

  def change
  	add_reference :votes, :users, foreign_key: true
  end

end

