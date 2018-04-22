
class RemoveColAddColQuestion < ActiveRecord::Migration[4.2]

  def change
  	remove_column :questions, :question
  	add_column :questions, :description, :string
  end

end

