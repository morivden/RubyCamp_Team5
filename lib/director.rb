require 'singleton'
#require_relative 'map'
#require_relative 'info_window'
require_relative 'player'
require_relative 'vim'
require_relative 'emacs'
require_relative 'ruby'
require_relative 'obstacle'
#require_relative 'enemy'
#require_relative 'enemy2'
#require_relative 'enemy3'
#require_relative 'enemy4'
#require_relative 'coin'

class Director
  include Singleton
  attr_reader :player, :item, :obstacles #,map
  RANDOM = 1500

  def initialize
    #@start_time = Time.now
    #@count = TIME_LIMIT

   # @map = Map.new(File.join(File.dirname(__FILE__), "..", "images", "map.dat"))
   # @info_window = InfoWindow.new(@map.height, @count)
    @characters = []
    @items = []
    @rand_items = 0
    @obstacles = []
    40.times do
      point = [rand(2..23), rand(2..16)]
      @obstacles << Obstacle.new(point[0] * 32, point[1] * 32)
    end
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
    @characters += @obstacles
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
    Sprite.check(@characters, @items)

  end

  def random
    @rand_vim = rand(RANDOM)
    @rand_emacs = rand(RANDOM)
    @rand_ruby = rand(RANDOM/3)
    if @rand_vim == 30
      @item = Vim.new
      @items << @item
    elsif @rand_emacs == 40
      @item = Emacs.new
      @items << @item
    elsif @rand_ruby == 50
      @item = Ruby.new
      @items << @item
    end
    Sprite.draw(@items)
  end

end
