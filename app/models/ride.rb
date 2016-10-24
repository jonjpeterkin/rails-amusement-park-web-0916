class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


	def take_ride
		message = ""
		message << "You do not have enough tickets the #{attraction.name}. " if user.tickets < attraction.tickets
		message << "You are not tall enough to ride the #{attraction.name}. " if user.height < attraction.min_height
		# byebug
		if !message.nil? && message != "" 
			message = message.strip
			message.prepend("Sorry. ") 
		else
			update_user
			"Thanks for riding the #{attraction.name}!"
		end
	end

	private

		def update_user
			user.nausea += attraction.nausea_rating
			user.happiness += attraction.happiness_rating
			user.tickets -= attraction.tickets
			user.save
		end
end
