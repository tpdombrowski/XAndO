class Tile < Chingu::GameObject
	attr_reader :height, :width

	HEIGHT = 15
	WIDTH = 15
	@height, @width = HEIGHT, WIDTH
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: 'DefaultTile.png',
				zorder: 1,
			}.merge! options
		
		@grid_x, @grid_y = grid_x, grid_y
		
		super options
		
		self.x = (@grid_x + 0.5) * HEIGHT
		self.y = (@grid_y + 0.5) * WIDTH
	end
	
	def draw
		super()
	end
	
end