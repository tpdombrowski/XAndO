class Map < Chingu::GameObject
	attr_reader :tiles
	
	def initialize
		super()
		
		@x, @y = 0, 1
		@tiles = Array.new(2)
		
	end
	
	def generate_background
		@background_image = TexPlay.create_image($window, $window.width, $window.height)
		
		$window.render_to_image(@background_image) do
			all_tiles.each(&:draw)
		end
		@background_image.refresh_cache
	end
	
	def create_tiles
		
	end
	
	def draw
		@background_image.draw(0, 0, 1)
	end

end