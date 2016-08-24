require_relative 'character'

class Player < Character
  attr_reader :life, :score
  DELTA = 2
  def initialize
    image = Image.load(image_path("player.png"))
    image.set_color_key(C_WHITE)
    super(280, 100, image)
    @life = 3
    @get_ruby = 0
    @get_vim = 0
    @get_emacs = 0
  end

  def update
    #map = Director.instance.map
    dy = -DELTA if Input.key_down?(K_UP) && @pixel_y > DELTA
    dy = DELTA  if Input.key_down?(K_DOWN) && @pixel_y < Window.height - @image.height
    dx = DELTA  if Input.key_down?(K_RIGHT) && @pixel_x < Window.width - @image.width
    dx = -DELTA if Input.key_down?(K_LEFT) && @pixel_x > DELTA
    move_pixel(dx: dx, dy: dy)
  end

  def shot(obj)
      if obj.is_a?(Ruby)
          @get_ruby += 1
      elsif obj.is_a?(Vim)
          @get_vim += 1
      elsif obj.is_a?(Emacs)
          @get_emacs += 1
      end
      p "Ruby : #{@get_ruby}"
      p "Vim : #{@get_vim}"
      p "Emacs : #{@get_emacs}"
      p "---------------"
  end
end
