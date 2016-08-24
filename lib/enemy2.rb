require_relative 'character'

class Golang < Character
  DELTA = 2
  def initialize(x, y)
    image = Image.load(image_path("golang.png"))
    image.set_color_key(C_BLUE)
    super(x, y, image)
	@dx = 0
	@dy = 0
  end

  def update
	calc_route
	self.x += @dx 
	self.y += @dy
  end

  def calc_route
	player = Director.instance.player
	if x - player.x < 0
	  @dx  = DELTA
	elsif x - player.x == 0
	  @dx = 0  
	else 
	  @dx = -DELTA
	end
	if y - player.y < 0
	  @dy = DELTA
	elsif y - player.y == 0
	  @dy = 0  
	else 
	  @dy = -DELTA
	end
  end
end
