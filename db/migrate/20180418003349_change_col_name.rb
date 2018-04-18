
class ChangeColName < ActiveRecord::Migration[4.2]

  def change
  	rename_column :answers, :answers, :answer
  	rename_column :answers, :user, :username
  end

end

