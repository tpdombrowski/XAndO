class Inside_Cave < Chingu::GameState
	CAVE_BACKGROUND_COLOR = Gosu::Color.rgba(100, 50, 50, 100)
	
	
	def initialize
		super()
	end
	
	def setup
		@player1 = Player.create(:x => 400, :y => 550)
		self.create_tiles()
	end
	
	def create_tiles
		#logic for creating the cave goes here
	end
	
	def draw
		super()
		self.generate_background
	end
	
	def generate_background
		$window.draw_quad(
		0,					0,		CAVE_BACKGROUND_COLOR,
		800, 				0,		CAVE_BACKGROUND_COLOR,
		0,				  600, 		CAVE_BACKGROUND_COLOR,
		800,    		  600, 		CAVE_BACKGROUND_COLOR,
		0)
	end

end