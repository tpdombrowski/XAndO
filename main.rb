#!/usr/bin/env ruby
require 'rubygems'
require 'gosu'
require 'chingu'

class Game < Chingu::Window
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_WIDTH = 480
	WINDOW_HEIGHT = 640
	
	def initialize
		
		super(WINDOW_HEIGHT,WINDOW_WIDTH,false)
		self.caption = "My Window"
		@player1 = Player.create(:x => 35, :y => 35)
		
	end
	
	def setup
		self.retrofy
	end

	def draw
		draw_background
		@player1.draw
	end
	
	def draw_background
		draw_quad(
		0,							 0,		BACKGROUND_COLOR,
		WINDOW_HEIGHT, 				 0,		BACKGROUND_COLOR,
		0,				  WINDOW_WIDTH, 	BACKGROUND_COLOR,
		WINDOW_HEIGHT,    WINDOW_WIDTH, 	BACKGROUND_COLOR,
		0)
	end
	
end

class Player < Chingu::GameObject
	
	
	def initialize(options = {})
		options = {
			x: 0,
			y: 0,
			image: 'RED.png'
		}.merge! options
		
		super options
	end
	
	def setup
		self.input = {  [:holding_left, :holding_a] => :holding_left, 
                    [:holding_right, :holding_d] => :holding_right, 
					[:holding_down,  :holding_s] => :holding_down, 
					[:holding_up,    :holding_w] => :holding_up, }
    
		self.zorder = 1
		@speed = 4
   
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
	
	def move(x,y)
		self.factor_x = self.factor_x.abs   if x > 0
		self.factor_x = -self.factor_x.abs  if x < 0
    
		self.x += x
    
		self.y += y
	end
	
end

Game.new.show