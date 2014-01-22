class Enemy < Chingu::GameObject
	trait :collision_detection
	trait :bounding_box
	trait :asynchronous
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			zorder: 3,
		}.merge! options
		
		super(options)
	end
	
	def update
		super()
		
		self.each_bounding_box_collision(Player) do |enemy, player|
			player.transform_x
		end
		self.restrict()
		
	end
	
	def move(x, y)
		self.x += x
		self.y += y
	end
	
	def restrict
		if self.x < 1
			self.x = 1
		elsif self.x > 1599
			self.x = 1599
		elsif self.y > 1599 or self.y < 1
			self.y = self.y % 1599
		end
	end
	
end