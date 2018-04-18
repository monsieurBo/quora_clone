
class NewColumn < ActiveRecord::Migration[4.2]

  def change
  	add_column :questions, :title, :string
  end

end

