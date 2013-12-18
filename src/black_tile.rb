class BlackTile < Tile
	trait :bounding_box 
	trait :collision_detection
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: "BlackTile.png",
			}.merge! options
			
		super(grid_x, grid_y, options)
	end
	
	def setup
		options = {
			file: "tiles_8x8.png",
			width: 20,
			height: 20,
			delay: 1000,
		}
		@animation = Animation.new(options)
	end
	
	def update
		super()
		@image = @animation.next
	end
	
end