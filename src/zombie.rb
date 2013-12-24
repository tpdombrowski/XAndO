class Zombie < Enemy
	trait :animation
	
	def initialize(options = {})
		options = {
			image: "zombie_front.png"
		}.merge! options
		@speed = 2
		
		super(options)
	end
	
	def update
		super()
		self.move(0, -@speed)
	end
	
end