class Player < Chingu::GameObject
	
	
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			image: 'spacecraft.png',
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
					[:space]                     	=> :transform, }
    
		self.zorder = 2
		@speed = 3
   
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
		randomX = rand(50..590)
		randomY = rand(50..430)
		@p = Player.create(:x => randomX, :y => randomY)
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
		self.image = 'BLUE.png'
	end
	
	def move(x,y)
	
		#self.factor_x = self.factor_x.abs   if x > 0
		#self.factor_x = -self.factor_x.abs  if x < 0
    
		self.x += x
		self.y += y
		
		self.angle = self.angle + 5
		
	end
	
end