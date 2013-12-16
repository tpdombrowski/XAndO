class Map < Chingu::GameObject
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_WIDTH = 480
	WINDOW_HEIGHT = 640
	
	def initialize
		super()
	end
	
	def setup
		self.create_tiles
	end
	
	def generate_background
		@background_image = TexPlay.create_image($window, $window.width, $window.height)
		
		$window.render_to_image(@background_image) do
			all_tiles.each(&:draw)
		end
		@background_image.refresh_cache
	end
	
	def create_tiles
		
		# Current window size is 640 by 480 and 
		# tile size is 20x20, so we have 32 
		# across and 24 down.
		rowSwitch = false
		(0..32).each do |i|
			(0..24).each do |q|
				if ((q % 2) == 0)
					rowSwitch = true
				else
					rowSwitch = false
				end
				
				if (i % 2 == 0 && rowSwitch == true)
					@tile = WhiteTile.create(i, q)
				else
					@tile = BlackTile.create(i, q)
				end
			end
		end
		
	end
	
	def draw
		super()
		self.generate_background
	end
	
	def generate_background
		$window.draw_quad(
		0,							 0,		BACKGROUND_COLOR,
		WINDOW_HEIGHT, 				 0,		BACKGROUND_COLOR,
		0,				  WINDOW_WIDTH, 	BACKGROUND_COLOR,
		WINDOW_HEIGHT,    WINDOW_WIDTH, 	BACKGROUND_COLOR,
		0)
	end

end