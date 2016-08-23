require 'dxruby'

require_relative 'director'
# require_relative 'character'
require_relative 'sprite_dlang'
require_relative 'sprite_vim'

Window.caption = "maptest"
Window.width = 800
Window.height = 600

director = Director.new

# メイン
Window.loop do
    # Escキーで終了
    break if Input.keyPush?(K_ESCAPE)

    director.play

end
