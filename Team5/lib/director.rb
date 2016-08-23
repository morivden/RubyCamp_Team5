require 'singleton'
#require_relative 'map'
#require_relative 'info_window'
require_relative 'player'
#require_relative 'enemy'
#require_relative 'enemy2'
#require_relative 'enemy3'
#require_relative 'enemy4'
#require_relative 'coin'

class Director
  include Singleton
  attr_reader :player #,map
  
  def initialize
    #@start_time = Time.now
    #@count = TIME_LIMIT

   # @map = Map.new(File.join(File.dirname(__FILE__), "..", "images", "map.dat"))
   # @info_window = InfoWindow.new(@map.height, @count)
    @characters = []
	
    # @coins = []
    # 10.times do
      # point = [rand(1..24), rand(1..16)]
      # # 移動不可能なマスか、すでにコインが配置されているマスの場合はやり直す
      # if !@map.movable?(*point) ||
         # @coins.any?{|coin| [coin.cell_x, coin.cell_y] == point}
        # redo
      # end
      # @coins << Coin.new(*point)
    # end
    # @characters += @coins
    # @enemies = []
    # @enemies << Enemy.new(11,7)
    # @enemies << Enemy2.new(17,5)
    # @enemies << Enemy3.new(3,11)
    # @enemies << Enemy4.new(11,7)
    # @characters += @enemies
	
    @player = Player.new
    @characters << @player
  end

  def play
 
    # # ゲームオーバーになったら描画以外のことはしない
    # unless game_over?
      # count_down
    Sprite.update(@characters)
      # Sprite.check(@enemies, @player, :hit, :attacked)
      # Sprite.check(@player, @coins)
      # compact
    # end


    #@map.draw
    #@info_window.draw
    Sprite.draw(@characters)
  end
  
end
