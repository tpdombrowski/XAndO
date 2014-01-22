class Harpoon < Weapon
	trait :animation
	trait :viewport
	attr_accessor :facing
	
	def initialize(direction, options = {})
		options = {
			image: "harpoon.png"
		}.merge! options
		@speed = 4
		
		@facing = direction
		
		super(options)
	end
	
	def update
		super()
		
		case @facing
		when :east
			self.move(@speed, 0)
		when :west
			self.move(-@speed, 0)
		when :south
			self.move(0, @speed)
		else
			self.move(0, -@speed)
		end
		
		self.each_bounding_box_collision(Whale) do |harpoon, whale|
			harpoon.destroy
			whale.death
		end

		self.each_bounding_box_collision(Zombie) do |harpoon, zombie|
			harpoon.destroy
			zombie.hit
		end
		
	end
	
end