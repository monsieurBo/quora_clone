
class CreateAnswers < ActiveRecord::Migration[4.2]

  def change
  	create_table :answers do |t|
  		t.string :answers
  		t.string :user
  		t.timestamps
  	end
  end

end

