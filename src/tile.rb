class Tile < Chingu::GameObject
	trait :bounding_box
	trait :collision_detection
	HEIGHT = 40
	WIDTH = 40
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: "DefaultTile.png",
				zorder: 1,
			}.merge! options
		
		@grid_x, @grid_y = grid_x, grid_y
		
		super(options)
		
		self.x = (@grid_x + 0.5) * HEIGHT
		self.y = (@grid_y + 0.5) * WIDTH
	end
end