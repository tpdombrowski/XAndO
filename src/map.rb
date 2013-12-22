class Map < Chingu::GameState
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_WIDTH = 600
	WINDOW_HEIGHT = 1600
	traits :viewport
	
	def initialize
		super()
	end
	
	def setup
		#Set the game_area.  This is a rectangle representing
		#the entire area of the map, not just the area that the
		#player is currently viewing.
		self.viewport.game_area = [0, 0, 1600, 600]
		self.viewport.lag = 0.95
		
		self.create_tiles
		@player1 = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
	end
	
	def create_tiles
		
		# Current game area size is 1600 by 600 and 
		# tile size is 40x40, so we have 40 
		# across and 15 down.
		(10..39).each do |i|
			(0..14).each do |q|
				@tile = WaterTile.create(i, q)
				@shoreTile = ShoreTile.create(9, q)
			end
		end
		
		#Generate a couple trees to see if they stop movement as they should
		@tree = Boundary.create(2, 3)
		@tree = Boundary.create(8, 5)
		
	end
	
	def draw
		super()
		self.generate_background
	end
	
	def update
		super()
		
		if @player1.x < 1
			@player1.x = 1
		elsif @player1.x > 1599
			@player1.x = 1599
		elsif @player1.y > 599 or @player1.y < 1
			@player1.y = @player1.y % 599
		end
		
		if (@player1.x > 800)
			self.viewport.x_target = 800
		else
			self.viewport.x_target = 0
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