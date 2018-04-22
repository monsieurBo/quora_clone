class User < ActiveRecord::Base
	has_many :vote
	has_many :questions
	has_many :answers
	has_secure_password

	validates :email, 
			   		:presence => true, 
			  		:uniqueness => true,
			  		:format => {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,}+\z/, message: 'is not a valid email address'}

end