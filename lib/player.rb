require_relative 'character'

class Player < Character
  attr_reader :life, :score
  attr_accessor :dx, :dy
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
    dx, dy = 0, 0
    dy = -DELTA if Input.key_down?(K_UP) && y > DELTA
    dy = DELTA  if Input.key_down?(K_DOWN) && y < Window.height - image.height
    dx = DELTA  if Input.key_down?(K_RIGHT) && x < Window.width - image.width
    dx = -DELTA if Input.key_down?(K_LEFT) && x > DELTA
    tmp_x = x
    tmp_y = y
    self.x += dx
    self.y += dy
    if Sprite.check(self, Director.instance.obstacles)
      self.x = tmp_x
      self.y = tmp_y
    end
  end

  def shot(obj)
      if obj.is_a?(Ruby)
          @get_ruby += 1
          p "Ruby : #{@get_ruby}"
          p "Vim : #{@get_vim}"
          p "Emacs : #{@get_emacs}"
          p "---------------"
      elsif obj.is_a?(Vim)
          @get_vim += 1
          p "Ruby : #{@get_ruby}"
          p "Vim : #{@get_vim}"
          p "Emacs : #{@get_emacs}"
          p "---------------"
      elsif obj.is_a?(Emacs)
          @get_emacs += 1
          p "Ruby : #{@get_ruby}"
          p "Vim : #{@get_vim}"
          p "Emacs : #{@get_emacs}"
          p "---------------"
      end

  end
end
