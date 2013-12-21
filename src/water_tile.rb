class WaterTile < Tile
	
		def initialize(grid_x, grid_y, options = {})
			options = {
					image: "ocean.png"
			}.merge! options
			
			super(grid_x, grid_y, options)
		end
	
end