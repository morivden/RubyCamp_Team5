require_relative 'character'

class Emacs < Character
  def initialize(x, y)
    image = Image.load(image_path("emacs.png"))
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end
=begin
  def hit(obj)
    vanish
  end
=end
end
