
class AddScrambledcookies < ActiveRecord::Migration[4.2]

  def change
  	add_column :users, :scrambled_cookies, :string
  end

end

