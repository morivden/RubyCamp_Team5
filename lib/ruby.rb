require_relative 'character'

class Ruby < Character
  def initialize
    @s2 = SoundEffect.new(1000,WAVE_TRI) do
      [160,100]
    end
    image = Image.load(image_path("ruby.png"))
    x = rand(Window.width - image.width)
    y = rand(Window.height - image.height)
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end
    def hit(obj)
      if obj.is_a?(Player)
        vanish
        @s2.play
      elsif obj.is_a?(Dlang)
        vanish
      end
    end
end
