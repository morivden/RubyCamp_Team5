require_relative 'character'

class Vim < Character
  def initialize
    @s2 = SoundEffect.new(1000,WAVE_TRI) do
      [110,80]
    end
    image = Image.load(image_path("vim.png"))
    x = rand(Window.width - image.width)
    y = rand(Window.height - image.height)
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end

  def hit(obj)
    if obj.is_a?(Player)
      vanish
      @s2.play
    end

  end

end