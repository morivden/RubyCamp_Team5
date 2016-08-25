require_relative 'character'

class Prison < Character
  def initialize(x, y)
    image = Image.load(image_path("rouya.png"))
    image.set_color_key(C_WHITE)
    super(x, y, image)
  end
end
