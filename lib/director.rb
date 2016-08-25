require 'singleton'
require_relative 'info_window'
require_relative 'player'
require_relative 'vim'
require_relative 'emacs'
require_relative 'ruby'
require_relative 'prison'
require_relative 'obstacle'
require_relative 'dlang_enemy'
require_relative 'golang_enemy'
require_relative 'lisp_enemy'

class Director
    include Singleton
    attr_reader :player, :item, :obstacles
    attr_accessor :ending_flag
    RANDOM = 60 * 100

    def initialize

        @info_window = InfoWindow.new
        @characters = []
        @obstacles = []
        @enemies = []
        @items = []
        @prison = []
        @player = Player.new
        @enemies << Dlang.new(1,600)
        @enemies << Golang.new(850,600)
        @enemies << Lisp.new(850,1)
        @prison << Prison.new(Window.width - 64, Window.height - 96)
        set_obstacle(6, [1,14], [1,9])
        set_obstacle(6, [15,28], [1,9])
        set_obstacle(6, [1,14], [10,18])
        set_obstacle(10, [15,28], [10,18])
        @characters << @prison
        @characters += @obstacles
        @characters += @enemies
        @characters << @player

        @ending_flag = false
    end

    def play
        # # ゲームオーバーになったら描画以外のことはしない
        unless game_over?
            Sprite.update(@characters)
            random
            Sprite.check(@player, @enemies)
            Sprite.check(@characters, @items)
            Sprite.check(@player, @prison)
        end
        @info_window.draw
        Sprite.draw(@characters)
        Sprite.draw(@items)

        if game_over?
            return 1
        elsif @ending_flag
            return 2
        end
    end

    def game_over?
        return @player.life <= 0
    end

    def set_obstacle(n, rw, rh)
        n.times do
            rx, ry = rand(rw[0]..rw[1]), rand(rh[0]..rh[1])
            r = rand(0..3)
            dirs = [[1,0], [-1,0], [0,1], [0,-1]]
            obs = []
            #禁止
            redo if (rx > 27 && ry > 17) || (rx+dirs[r][0] > 27 && ry+dirs[r][1] > 17) || rx+dirs[r][0] == 0 || ry+dirs[r][1] == 0
            obs << Obstacle.new(rx*32, ry*32)
            obs << Obstacle.new((rx+dirs[r][0])*32, (ry+dirs[r][1])*32)
            redo if Sprite.check(obs[0], @obstacles) || Sprite.check(obs[1], @obstacles)
            @obstacles += obs
        end
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
