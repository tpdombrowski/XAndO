class Player < Chingu::GameObject
	trait :collision_detection
	trait :bounding_box
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
					[:space]                     	=> :transform_boat, }
    
		self.zorder = 2
		@speed = 3
	end
	
	def update
		super()
		
		self.each_bounding_box_collision(WaterTile) do
			self.transform_boat
		end
	end
	
	def makeNewPlayer
		randomX = rand(50..750)
		randomY = rand(50..550)
		@p = Player.create(:x => randomX, :y => randomY)
	end
	
	def holding_left
		self.image = "pirate_lside.png"
		move(-@speed, 0)
	end
	
	def holding_right
		move(@speed, 0)
		self.image = "pirate_rside.png"
	end
	
	def holding_up
		move(0, -@speed)
		self.image = "pirate_back.png"
	end
	
	def holding_down
		move(0, @speed)
		self.image = "pirate_front.png"
	end
	
	def transform_boat
		self.image = "ship1.png"
	end
	
	def move(x,y)
		self.x += x
		self.y += y
	end
	
end