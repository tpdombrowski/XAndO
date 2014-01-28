class Map < Chingu::GameState
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_HEIGHT = 1600
	WINDOW_WIDTH = 1200
	trait :viewport
	trait :asynchronous
	
	def initialize
		super()
	end
	
	def setup
		
		#Set the game_area.  This is a rectangle representing
		#the entire area of the map, not just the area that the
		#player is currently viewing.
		self.viewport.game_area = [0, 0, WINDOW_HEIGHT, WINDOW_WIDTH]
		self.viewport.lag = 0.95
		self.create_tiles
		
		@player1 = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
		@zombie = Zombie.create(:x => 45, :y => 550)
		@whale = Whale.create(:x => 1350, :y => 450)
		
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
		
		@cave = Cave.create(4, 3)
		
		#Generate a couple trees to see if they stop movement as they should
        @tree = Boundary.create(2, 3)
		@tree = Boundary.create(8, 5)
		@tree = Boundary.create(7, 19)
		@tree = Boundary.create(35, 26)
		@tree = Boundary.create(24, 17)
		@rock = Rock.create(17,17)
		@rock = Rock.create(4,21)
		@rock = Rock.create(31,28)
		@trunk = Trunk.create(30,19)
		@trunk = Trunk.create(25,22)
		@trunk = Trunk.create(12,23)
		@flower = Flower.create(32,18)
		@flower = Flower.create(3, 5)
		@flower = Flower.create(6, 11)
		@flower = Flower.create(2, 13)
		@flower = Flower.create(12, 20)
		@flower = Flower.create(11, 21)
		@flower = Flower.create(12, 21)
		@flower = Flower.create(11, 20)
		@flower = Flower.create(5, 26)
		@bush = Bush.create(7, 1)
		@bush = Bush.create(15,21)
		@bush = Bush.create(31, 24)
		
	end
	
	def draw
		super()
		self.generate_background
	end
	
	def update
		super()	
		self.adjust_viewport()
		@zombie.moveTowardsPlayer(@player1.x, @player1.y)
		
		Cave.each_collision(Player) do
			switch_game_state(Inside_Cave)
		end

	end
	
	def adjust_viewport
		if ((@player1.x / 800) >= 1)
			self.viewport.x_target = (@player1.x / 800) * 800
		else
			self.viewport.x_target = 0
		end
		
		if ((@player1.y / 600) >= 1)
			self.viewport.y_target = (@player1.y / 600) * 600
		else
			self.viewport.y_target = 0
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