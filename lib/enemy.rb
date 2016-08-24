require_relative 'character'

class Dlang < Character
  def initialize(x, y)
    image = Image.load(image_path("dlang.png"))
    image.set_color_key([44,238,229])
    super(x, y, image)
    @dx = 1
    @dy = 1
  end

  def update
    move
    self.x += @dx
    self.y += @dy
  end

  def move
    if x <= 0
      @dx = 5
    elsif x >= (Window.width - image.width)
      @dx = -5
    end
    if y <= 0
      @dy = 5
    elsif y >= 550
      @dy = -5
    end
  end

end
