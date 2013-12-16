class WhiteTile < Tile

	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "WhiteTile.png",
			}.merge! options
			
		super(grid_x, grid_y, options)
	end

end