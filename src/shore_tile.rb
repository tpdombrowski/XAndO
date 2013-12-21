class ShoreTile < Tile

	def initialize(grid_x, grid_y, options = {})
		options = { 
			image: "shoreline.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end

end