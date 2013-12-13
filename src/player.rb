class Player < Chingu::GameObject
	
	attr_accessor :count
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			image: 'DefaultTile.png',
			center_x: 0,
			center_y: 0,
			angle: 0,
			factor_x: 1,
			factor_y: 1,
		}.merge! options
		@count = 0
		super options
	end
	
	def setup
		self.input = {  [:holding_left, :holding_a] => :holding_left, 
                    [:holding_right, :holding_d]    => :holding_right, 
					[:holding_down,  :holding_s] 	=> :holding_down, 
					[:holding_up,    :holding_w] 	=> :holding_up, 
					[:space]                     	=> :transform, }
    
		self.zorder = 1
		@speed = 4
   
	end
	
	def update
		super
		if self.x > 639 or self.x < 1
			self.x = self.x % 639
			self.makeNewPlayer	
		
		elsif self.y > 479 or self.y < 1
			self.y = self.y % 479
			self.makeNewPlayer
		end
	end
	
	def makeNewPlayer
		@p = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
	end
	
	def holding_left
		move(-@speed, 0)
	end
	
	def holding_right
		move(@speed, 0)
	end
	
	def holding_up
		move(0, -@speed)
	end
	
	def holding_down
		move(0, @speed)
	end
	
	def transform
		self.image = 'sprite1.png'
	end
	
	def move(x,y)
		self.factor_x = self.factor_x.abs   if x > 0
		self.factor_x = -self.factor_x.abs  if x < 0
    
		self.x += x
    
		self.y += y
		
		self.angle = self.angle + 5
		
		
	end
	
end