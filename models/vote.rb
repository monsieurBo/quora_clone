class Vote < ActiveRecord::Base
	belongs_to :answer
	belongs_to :users

	validates :user_id,
						:presence => true
						# :uniqueness => true


end