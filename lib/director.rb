require 'singleton'
require_relative 'info_window'
require_relative 'player'
require_relative 'vim'
require_relative 'emacs'
require_relative 'ruby'
require_relative 'obstacle'
require_relative 'enemy'
require_relative 'enemy2'
require_relative 'enemy3'

class Director
  include Singleton
  attr_reader :player, :item, :obstacles
  RANDOM = 60 * 100

  def initialize

    @info_window = InfoWindow.new
    @characters = []
	@obstacles = []
	@enemies = []
    @items = []
	@player = Player.new
	 40.times do
      point = [rand(1..29), rand(1..18)]
      @obstacles << Obstacle.new(point[0] * 32, point[1] * 32)
    end
    @enemies << Dlang.new(1,500)
    @enemies << Golang.new(750,550)
    @enemies << Lisp.new(700,1)

    @characters += @obstacles
	@characters += @enemies
    @characters << @player

  end

  def play

    # # ゲームオーバーになったら描画以外のことはしない
    unless game_over?
      Sprite.update(@characters)
	  random
      Sprite.check(@player, @enemies)
	  Sprite.check(@characters, @items)
    end

    @info_window.draw
    Sprite.draw(@characters)
	Sprite.draw(@items)

    if game_over?
        return 1
    end

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
    if r % (60*20) == 0
      @item = Vim.new
      @items << @item
	end
    if r % (60*20) == 0
      @item = Emacs.new
      @items << @item
	end
    if r % (60*5) == 0
      @item = Ruby.new
      @items << @item
    end
  end

end
