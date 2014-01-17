class Trunk < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "trunk.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end