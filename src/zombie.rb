class Zombie < Enemy
	trait :animation
	trait :asynchronous
<<<<<<< Updated upstream

	@@numHits = 1
=======
>>>>>>> Stashed changes
	
	def initialize(options = {})
		options = {
			image: "zombie_front.png"
		}.merge! options
		@speed = 2.1
		
		super(options)
	end
	
	def update
		super()
		self.each_bounding_box_collision(WaterTile) do
			transform_ship
		end
	end
	
	def transform_ship
		self.image = "zombie_ship.png"
	end
	
	def transSquall
		self.image = "sprite1.png"
	end

	def norm
		self.image = "zombie_front.png"
	end

	def hitCheck(num)
		@@numHits += num
		if @@numHits > 5
			self.destroy
		end
	end

	def hit
		self.async do |q|
			2.times do
				q.call :transSquall
				q.wait 100
				q.call :norm
			end
		end
	end

	def moveTowardsPlayer(playerX, playerY)

		if playerX > self.x and playerY > self.y
			self.move(@speed, @speed)
		elsif playerX < self.x and playerY < self.y
			self.move(-@speed, -@speed)
		elsif playerX > self.x and playerY < self.y
			self.move(@speed, -@speed)
		elsif playerX < self.x and playerY > self.y
			self.move(-@speed, @speed)
		elsif playerX = self.x and playerY != self.y
			playerY > self.y ? self.move(0, @speed) : move(0, -@speed)
		elsif playerX != self.x and playerY = self.y
			playerX > self.x ? self.move(@speed, 0) : move(-@speed, 0)
		else
			self.move(0,0)
		end
		
		
	end

end