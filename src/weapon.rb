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
		
		self.each_bounding_box_collision(Whale) do |weapon, whale|
			whale.death
			Weapon.destroy_all
		end
	end
	
	def move(x, y)
		self.x += x
		self.y += y
	end
	
end