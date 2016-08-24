class Character < Sprite
  attr_reader :pixel_x, :pixel_y

  def initialize(pixel_x, pixel_y, image)
    @image = image
    @pixel_x = pixel_x
    @pixel_y = pixel_y
    super(@pixel_x, @pixel_y, @image)
  end

  # 「キーワード引数」を使っています
  def move_pixel(dx: nil,dy: nil)
    if dx
      @pixel_x += dx
      self.x += dx
    end
    if dy
      @pixel_y += dy
      self.y += dy
    end
  end

  private

  def image_path(filename)
    return File.join(File.dirname(__FILE__), "..", "images", filename)
  end
end
