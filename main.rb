require 'dxruby'
require_relative 'lib/director'

Window.width = 960  # 32px * 25マス
Window.height = 672 # 32px * 17マス + 画面下部のスペース(54px)

bg_start = Image.load("images/opening_re.png")
bg_rule = Image.load("images/rule960.png")
bg_map = Image.load("images/background.png")

bgm = Sound.new("lib/tamco03.mid")
title_sound = Sound.new("lib/title.mid")
clear_sound = Sound.new("lib/clear.mid")
gameover_sound = Sound.new("lib/gameover.mid")


gameover_flag = 0
clear_flag = 0

# スタート画面
title_sound.play
Window.loop do
    Window.draw(0, 0, bg_start)
    break if Input.key_push? K_RETURN
end

# ルール説明画面
Window.loop do
    Window.draw(0, 0, bg_rule)
    break if Input.key_push? K_RETURN
end

#ゲーム画面
title_sound.stop
bgm.play
Window.loop do
    Window.draw(0, 0, bg_map)
    gameover_flag = Director.instance.play
    break if (Input.key_push? K_ESCAPE) || (gameover_flag)
end

if gameover_flag == 1
    bgm.stop
    gameover_sound.play
    bg_gameover = Image.load("images/game_over.png")
    Window.loop do
        Window.draw(26, 151, bg_gameover)
        break if Input.key_push? K_RETURN
    end
elsif gameover_flag == 2
    bgm.stop
    clear_sound.play
    bg_clear = Image.load("images/game_clear.png")
    Window.loop do
        Window.draw(122, 63, bg_clear)
        break if Input.key_push? K_RETURN
    end
end
