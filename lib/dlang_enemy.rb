require_relative 'character'

class Dlang < Character
  def initialize(x, y)
    image = Image.load(image_path("dlang.png"))
    image.set_color_key([44,238,229])
    super(x, y, image)
    @dx = 5
    @dy = 5
  end

  def update
    move
    tmp_x = self.x
    tmp_y = self.y
    dx = @dx + rand(1..3)
    self.x += dx
    if Sprite.check(self, Director.instance.obstacles)
      @dx = -dx
    end
    self.x = tmp_x
    self.y += @dy
    dy = @dy + rand(1..3)
    if Sprite.check(self, Director.instance.obstacles)
      @dy = -dy
    end
    self.y = tmp_y
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
