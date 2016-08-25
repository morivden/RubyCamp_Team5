require_relative 'character'

class Obstacle < Character
    def initialize(x, y)
        image = Image.load(image_path("block.png"))
        image.set_color_key(C_WHITE)
        super(x, y, image)
    end
end
