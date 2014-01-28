class Cave < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "cave.png",
				scale: 0.4, 
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
	def update
		super()
	end

end