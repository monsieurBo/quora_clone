
class AddUpdownCol < ActiveRecord::Migration[4.2]

  def change
  	add_column :votes, :updown, :boolean
  end

end

