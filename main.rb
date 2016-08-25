require 'dxruby'
require_relative 'lib/director'

Window.width = 960  # 32px * 25マス
Window.height = 672 # 32px * 17マス + 画面下部のスペース(54px)

bg_start = Image.load("images/start960.png")
bg_rule = Image.load("images/rule960.png")
bg_map = Image.load("images/background.png")


bgm = Sound.new("lib/tamco03.mid")
bgm.play

gameover_flag = 0
clear_flag = 0

# スタート画面
Window.loop do
    Window.draw(0, 0, bg_start)
    break if Input.key_push? K_RETURN
end

# ルール説明画面
Window.loop do
    Window.draw(0, 0, bg_rule)
    break if Input.key_push? K_RETURN
end

Window.loop do
    Window.draw(0, 0, bg_map)
    gameover_flag = Director.instance.play
    break if (Input.key_push? K_ESCAPE) || (gameover_flag)
end

if gameover_flag == 1
    bg_gameover = Image.load("images/maptest.png")
    Window.loop do
        Window.draw(0, 0, bg_gameover)
        break if Input.key_push? K_RETURN
    end
elsif gameover_flag == 2
    bg_clear = Image.load("images/maptest.png")
    Window.loop do
        Window.draw(0, 0, bg_clear)
        break if Input.key_push? K_RETURN
    end
end
