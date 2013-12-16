class BlackTile < Tile
	
	def initialize(grid_x, grid_y, options = {})
		options = { 
				image: "BlackTile.png",
			}.merge! options
			
		super(grid_x, grid_y, options)
	end
	
	def setup
		options = {
			file: "DefaultTile.png",
			width: 20,
			height: 20,
			delay: 3000,
		}
		@animation = Animation.new(options)
	end
	
	def update
		super()
		@image = @animation.next
	end
	
end