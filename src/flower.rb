class Flower < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "flower1.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end