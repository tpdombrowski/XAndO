class Rock < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "rock1.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end