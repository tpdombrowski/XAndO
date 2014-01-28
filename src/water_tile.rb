class WaterTile < Tile
	trait :animation
	
		def initialize(grid_x, grid_y, options = {})
			options = {
					image: "ocean_con2.png"
			}.merge! options
			
			super(grid_x, grid_y, options)
		end
		
		def setup
			options = {
				file: "ocean_con2.png",
				width: 40,
				height: 40,
				delay: 1000,
			}
			
			@animation = Animation.new(options)
		end
		
		def update
			super()
			@image = @animation.next
			
			self.each_bounding_box_collision(Player) do |waterTile, player|
				player.transform_boat()
			end
		end
	
end