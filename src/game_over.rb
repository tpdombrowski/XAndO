class GameOver < Chingu::GameState
	Chingu::Text.trait :asynchronous
	
	def initialize
		super()
	end
	
	def setup
		self.input = {  [:space] => :endGame, }
		
		@messageMajor = Chingu::Text.new("Game Over", :x => 200, :y => 200, :zorder => 5, 
									:size => 100, :font => 'Comic Sans MS')
		@messageMinor = Chingu::Text.new("And worse, this game over screen is in Comic Sans", 
										:x => 180, :y => 290, :zorder => 5, :size => 25, 
										:font => 'Comic Sans MS')
	end
	
	def draw
		super()
		@messageMajor.draw()
		@messageMinor.draw()
		
		# Can't get this to work.
		# Should cause the line of text to fade out then vanish
		#@messageMajor.async do |q|
		#	q.tween(2000, :alpha => 0, :scale => 2)
		#	q.call(:destroy)
		#end
	end
	
	def endGame
		$window.exit()
	end
end