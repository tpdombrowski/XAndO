class Harpoon < Weapon
	trait :animation
	
	def initialize(options = {})
		options = {
			image: "harpoon.png"
		}.merge! options
		@speed = 4
		
		super(options)
	end
	
	def update
		super()
		self.move(@speed, 0)
	end
	
end