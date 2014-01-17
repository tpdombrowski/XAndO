class Bush < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "bush1.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end