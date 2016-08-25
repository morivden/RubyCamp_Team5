require_relative 'character'

# プレイヤーのあとをつけてくる敵（紫）
class Lisp < Character
  # UPDATE_THRESHOLD = 10 # 10フレームごとに移動する（はやい）
  # PAST_DEPTH = 7 # どれだけ過去のプレイヤーの位置を追うか

  def initialize(x, y)
    image = Image.load(image_path("lisp.png"))
    image.set_color_key([255, 255, 12])
    super(x , y, image)
    @dx, @dy = 0
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
