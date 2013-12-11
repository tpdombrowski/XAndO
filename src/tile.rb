class Tile < Chingu::GameObject
	attr_accessor :grid_x

	HEIGHT = 8
	WIDTH = 8
	SPRITE_SHEET_COLUMNS = 8
	
	def z; 0; end
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: 'DefaultTile.png',
			}.merge! options
		
		@grid_x, @grid_y = grid_x, grid_y
		#@@sprites ||= SpriteSheet.new("tiles_8x8.png", HEIGHT, WIDTH, SPRITE_SHEET_COLUMNS)
		
		super(options)
		
		self.x = (@grid_x + 0.5) * HEIGHT
		self.y = (@grid_y + 0.5) * WIDTH
	end
	
	def draw
		super()
	end
end