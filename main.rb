require 'dxruby'
require_relative 'lib/director'

Window.width = 960  # 32px * 30マス
Window.height =  672 # 32px * 21マス
bgm = Sound.new("lib/tamco03.mid")
bgm.play
Window.loop do
  Director.instance.play
  break if Input.key_push? K_ESCAPE
end
