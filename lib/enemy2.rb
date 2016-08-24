require_relative 'character'

# 最短経路で近づいてくる敵（赤）
class Golang < Character

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
	  @dx  = 1
	elsif x - player.x == 0
	  @dx = 0  
	else 
	  @dx = -1
	end
	if y - player.y < 0
	  @dy = 1
	elsif y - player.y == 0
	  @dy = 0  
	else 
	  @dy = -1
	end
  end
end
