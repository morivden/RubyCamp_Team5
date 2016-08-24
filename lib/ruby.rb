require_relative 'character'

class Ruby < Character
  def initialize(x, y)
    image = Image.load(image_path("ruby.png"))
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end
    def hit(obj)
      vanish if obj.is_a?(Player)
    end
end
