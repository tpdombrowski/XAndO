class Boundary < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "tree.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end