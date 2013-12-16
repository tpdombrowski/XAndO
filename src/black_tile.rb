class BlackTile < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: "BlackTile.png",
			}.merge! options
			
		super(grid_x, grid_y, options)
	end
	
end