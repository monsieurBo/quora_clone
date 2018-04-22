
class RenameUsersColumn < ActiveRecord::Migration[4.2]

  def change
  	rename_column :votes, :users_id, :user_id
  end

end

