
class ChangeColNameUsersUser < ActiveRecord::Migration[4.2]

  def change
  	rename_column :questions, :users_id, :user_id
  	rename_column :answers, :users_id, :user_id
  end

end

