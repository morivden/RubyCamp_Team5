require_relative 'character'

class Player < Character
  attr_reader :life, :score
  DELTA = 2
  def initialize
    image = Image.load(image_path("player.png"))
    image.set_color_key(C_WHITE)
    super(280, 100, image)
    @life = 3
    @score = 0
  end

  def update
    #map = Director.instance.map
    dy = -DELTA if Input.key_down?(K_UP) && @pixel_y > DELTA
    dy = DELTA  if Input.key_down?(K_DOWN) && @pixel_y < Window.height - @image.height
    dx = DELTA  if Input.key_down?(K_RIGHT) && @pixel_x < Window.width - @image.width 
    dx = -DELTA if Input.key_down?(K_LEFT) && @pixel_x > DELTA
    move_pixel(dx: dx, dy: dy)
  end

end
