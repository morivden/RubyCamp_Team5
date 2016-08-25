require 'singleton'
#require_relative 'info_window'
require_relative 'player'
require_relative 'vim'
require_relative 'emacs'
require_relative 'ruby'
require_relative 'obstacle'
require_relative 'enemy'
require_relative 'enemy2'
require_relative 'enemy3'
#require_relative 'coin'

class Director
  include Singleton
  attr_reader :player, :item, :obstacles #,map
  RANDOM = 60 * 100

  def initialize
    #@start_time = Time.now
    #@count = TIME_LIMIT

   # @info_window = InfoWindow.new(@map.height, @count)
    @characters = []
    @items = []
    @rand_items = 0
    @obstacles = []
    40.times do
      point = [rand(2..23), rand(2..16)]
      @obstacles << Obstacle.new(point[0] * 32, point[1] * 32)
    end
    @enemies = []
    @enemies << Dlang.new(1,500)
    @enemies << Golang.new(750,550)
    @enemies << Lisp.new(700,1)
    @characters += @obstacles
	@characters += @enemies
    @player = Player.new

    @characters << @player

  end

  def play

    # # ゲームオーバーになったら描画以外のことはしない
    unless game_over?
	# count_down
    Sprite.update(@characters)
	random
    Sprite.check(@player, @enemies)
	Sprite.check(@characters, @items)
      # Sprite.check(@player, @coins)
      # compact
    end
	
    #@info_window.draw
	
    Sprite.draw(@characters)
	Sprite.draw(@items)

  end
  
  # 下記のいずれかの状態になったらゲーム終了
	#
	# ・ゲーム開始から <TIME_LIMIT> 秒が経過する
	# ・プレイヤーのライフが 0 になる
	# ・すべてのコインを取る
  def game_over?
	return @player.life <= 0
  end

  def random
    r = rand(RANDOM)
    if r % (60*25) == 0
      @item = Vim.new
      @items << @item
	end
    if r % (60*50) == 0
      @item = Emacs.new
      @items << @item
	end
    if r % (60*10) == 0
      @item = Ruby.new
      @items << @item
    end
  end

end
