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
	end
	
	def move(x, y)
		self.x += x
		self.y += y
	end

	
end