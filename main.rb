#!/usr/bin/env ruby
require 'rubygems' rescue nil
begin
  raise LoadError if defined?(Ocra)
  require '../chingu/lib/chingu'
rescue LoadError
  require 'chingu'
end
include Gosu
include Chingu

require_rel 'src/*'
DEBUG = false

class Game < Chingu::Window
	BACKGROUND_COLOR = Gosu::Color.rgba(200, 100, 100, 200)
	WINDOW_WIDTH = 480
	WINDOW_HEIGHT = 640
	
	def initialize
		super(WINDOW_HEIGHT,WINDOW_WIDTH,false)
		self.caption = "My Window"
		self.input = { :escape => :close }
		@player1 = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
		@tile1 = Tile.create(1, 0)
	end
	
	def setup
		self.retrofy
	end

	def draw
		super
		draw_background
	end
	
	def update
		super
		if @player1.x > 400
			@tile1.destroy
			
		elsif Player.size > 100
			Player.destroy_all
			@player1 = Player.create(:x => 340, :y => 240)
		end
		
	end
	
	def makeStars
		pl = Player.create(:x => 35, :y => 35, :center_x => 40, :center_y => 40)
		@player1.makemanyStars
	end
	
	def draw_background
		draw_quad(
		0,							 0,		BACKGROUND_COLOR,
		WINDOW_HEIGHT, 				 0,		BACKGROUND_COLOR,
		0,				  WINDOW_WIDTH, 	BACKGROUND_COLOR,
		WINDOW_HEIGHT,    WINDOW_WIDTH, 	BACKGROUND_COLOR,
		0)
	end
	
	def self.run
		new.show
	end
	
	def close
		exit
	end
	
end

Game.run

