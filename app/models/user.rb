class User < ActiveRecord::Base
  has_many :rides
	has_many :attractions, through: :rides

	validates :password, presence: true
	after_initialize :default_admin

	has_secure_password

	def mood
		if self.nausea >= self.happiness
			'sad'
		elsif self.nausea < self.happiness
			'happy'
		end
	end

	def default_admin
		self.admin = false if self.has_attribute?(:admin) && self.admin == nil
	end


end
