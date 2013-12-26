class Zombie < Enemy
	trait :animation
	trait :asynchronous
	
	def initialize(options = {})
		options = {
			image: "zombie_front.png"
		}.merge! options
		@speed = 2
		
		super(options)
	end
	
	def update
		super()
	end
	
end