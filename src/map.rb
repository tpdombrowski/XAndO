class Map < Chingu::GameState
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_WIDTH = 600
	WINDOW_HEIGHT = 800
	traits :viewport
	
	def initialize
		super()
	end
	
	def setup
		self.create_tiles
		@player1 = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
	end
	
	def create_tiles
		
		# Current window size is 800 by 600 and 
		# tile size is 40x40, so we have 20 
		# across and 15 down.
		(10..19).each do |i|
			(0..14).each do |q|
				@tile = WaterTile.create(i, q)
				@shoreTile = ShoreTile.create(9, q)
			end
		end
		
	end
	
	def draw
		super()
		self.generate_background
	end
	
	def update
		super()
		
		@player1.each_bounding_box_collision(WaterTile) do |player|
			player.transform_boat
		end
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

class DefaultMap < Map; end