class Weapon < Chingu::GameObject
	trait :collision_detection
	trait :bounding_box
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			zorder: 10,
		}.merge! options
		
		super(options)
	end
	
	def update
		super()
	end
	
	def move(x, y)
		self.x += x
		self.y += y
	end
	
end