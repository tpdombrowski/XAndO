class Player < Chingu::GameObject
	trait :collision_detection
	trait :bounding_box
	attr_accessor :facing
	attr_accessor :canMove
	
	
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
		@speed = 3
		@facing = :south
	end
	
	def update
		super()
		
		self.each_bounding_box_collision(WaterTile) do
			self.transform_boat
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
		self.image = "ship1.png"
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
	end
	
	def move(x,y)
		self.x += x
		self.y += y
	end
	
end