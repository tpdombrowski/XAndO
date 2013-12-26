class Whale < Enemy
	trait :animation
	
	def initialize(options = {})
		options = {
			image: "whale.png"
		}.merge! options
		
		super(options)
	end
	
	def update
		super()
	end
	
	def death
		self.image = "whale_dead.png"
	end
	
end