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
require 'texplay'
DEBUG = false

class Game < Chingu::Window
	WINDOW_WIDTH = 600
	WINDOW_HEIGHT = 800
	
	def initialize
		super(WINDOW_HEIGHT,WINDOW_WIDTH,false)
		self.input = { :escape => :close }		
	end
	
	def setup
		self.retrofy
		push_game_state(DefaultMap)
	end
	
	def self.run
		new.show
	end
	
	def update
		super()
		self.caption = "FPS: #{self.fps}"
	end
	
	def close
		exit()
	end
	
end

Game.run

