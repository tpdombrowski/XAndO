class Boundary < Tile
	trait :bounding_box
	trait :collision_detection
	
	def initialize(grid_x, grid_y, options = {})
		options = {
				image: "boundary.png"
		}.merge! options
		
		super(grid_x, grid_y, options)
	end
	
end