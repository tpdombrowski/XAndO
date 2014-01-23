class Player < Chingu::GameObject
	trait :collision_detection
	trait :bounding_box
	attr_accessor :facing, :canMove, :health
	
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			image: "pirate_front.png",
			center_x: 0,
			center_y: 0,
			angle: 0,
			factor_x: 1,
			factor_y: 1,
		}.merge! options
		
		super(options)
	end
	
	def setup
		self.input = {  [:holding_left, :holding_a] => :holding_left, 
                    [:holding_right, :holding_d]    => :holding_right, 
					[:holding_down,  :holding_s] 	=> :holding_down, 
					[:holding_up,    :holding_w] 	=> :holding_up, 
					[:space]                     	=> :shoot_harpoon, }
    
		self.zorder = 2
		@speed = 4
		@health = 3
		@facing = :south
		@healthImage = Gosu::Image.new($window, "media/hearts_full.png", false)
	end
	
	def update
		super()
		
		self.each_bounding_box_collision(WaterTile) do
			self.transform_boat
		end
		
		self.restrict()
	end
	
	def restrict
		if self.x < 1
			self.x = 1
		elsif self.x > 1599
			self.x = 1599
		elsif self.y > 1199
			self.y = 1199 
		elsif self.y < 1
			self.y = 1
		end	
	end
	
	def draw
		super()
		draw_health()
	end
	
	def draw_health
		if ((self.x / 800) >= 1 && (self.y / 600 >= 1))
			@healthImage.draw(((self.x / 800) * 800), ((self.y / 600) * 600), 3, 0.2, 0.2)
		elsif (self.x / 800 >= 1)
			@healthImage.draw(((self.x / 800) * 800), 0, 3, 0.2, 0.2)
		elsif (self.y / 600 >= 1)
			@healthImage.draw(0, ((self.y / 600) * 600), 3, 0.2, 0.2)
		else
			@healthImage.draw(0, 0, 3, 0.2, 0.2)
		end
	end

	def holding_left
		move(-@speed, 0)
		self.image = "pirate_lside.png"
		@facing = :west
	end
	
	def holding_right
		move(@speed, 0)
		self.image = "pirate_rside.png"
		@facing = :east
	end
	
	def holding_up
		move(0, -@speed)
		self.image = "pirate_back.png"
		@facing = :north
	end
	
	def holding_down
		move(0, @speed)
		self.image = "pirate_front.png"
		@facing = :south
	end
	
	def transform_boat
		self.image = "poop_ship.png"
	end
	
	def transform_x
		self.image = "red.png"
	end
	
	def shoot_harpoon
		if (@facing == :east)
			@harpoon = Harpoon.create(@facing, :x => self.x+30, :y => self.y+10, :scale => 0.5)
		elsif (@facing == :west)
			@harpoon = Harpoon.create(@facing, :x => self.x-30, :y => self.y+10, :angle => 180, :scale => 0.5)
		elsif (@facing == :south)
			@harpoon = Harpoon.create(@facing, :x => self.x, :y => self.y+20, :angle => 90, :scale => 0.5)
		elsif (@facing == :north)
			@harpoon = Harpoon.create(@facing, :x => self.x, :y => self.y-20, :angle => 270, :scale => 0.5)
		end
		
		self.adjust_health()
	end
	
	def adjust_health
		# paints a heart black depending on current health
		# texplay gets fooled by those slightly off-color red pixels,
		# though, so will have to pinpoint those pixels to fill them
		if (@health == 3)
			@healthImage.fill(275, 25, :color => :black)
			@health -= 1
		elsif (@health == 2)
			@healthImage.fill(150, 25, :color => :black)
			@health -= 1
		else
			@healthImage.fill(25, 25, :color => :black)
			@health -= 1
			$window.push_game_state(GameOver)
		end
		
	end
	
	def move(x,y)
		self.x += x
		self.y += y
	end
	
end