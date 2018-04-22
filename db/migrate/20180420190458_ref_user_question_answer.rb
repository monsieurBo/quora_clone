
class RefUserQuestionAnswer < ActiveRecord::Migration[4.2]

  def change
  	change_table :questions do |t|
    	t.belongs_to :users
    end

    change_table :answers do |t|
    	t.belongs_to :users
    end
  end

end

