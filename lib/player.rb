require_relative 'character'
class Player < Character
  attr_reader :life, :score, :get_ruby, :get_vim, :get_emacs
  def initialize
    image = Image.load(image_path("player.png"))
    image.set_color_key(C_WHITE)
    super(0, 0, image)
    @life = 1
    @get_ruby = 0
    @get_vim = 0
    @get_emacs = 0
	@delta = 3
	@time = 0
	@invincible_flag = 0
	@invi_time = 0
  end

  def update
    dx, dy = 0, 0
    dy = -@delta if Input.key_down?(K_UP) && y > @delta
    dy = @delta  if Input.key_down?(K_DOWN) && y < Window.height - image.height - 32
    dx = @delta  if Input.key_down?(K_RIGHT) && x < Window.width - image.width
    dx = -@delta if Input.key_down?(K_LEFT) && x > @delta
    tmp_x = x
    tmp_y = y
    self.x += dx
    self.y += dy
    if Sprite.check(self, Director.instance.obstacles)
      self.x = tmp_x
      self.y = tmp_y
    end
	
	#Vimの効果
	unless @get_vim.zero?
	  @time += 1
	  @delta = 5
	end 
	if @time >= 5 * 60
	  @time = 0
	  @get_vim = 0
	  @delta = 3
	end
	
	#無敵時間
	if @invincible_flag == 1
	  @invi_time += 1
	end
	if @invi_time >= 3 * 60
	  @invi_time = 0
	  @invincible_flag = 0
	end
	
  end

  def shot(obj)
      case obj 
	  when Ruby
		@get_ruby += 1
      when Vim
	    @time = 0 if @get_vim == 1
        @get_vim = 1
      when Emacs
        @get_emacs += 1
      when Dlang, Golang
		if @invincible_flag == 0
		if @get_emacs > 0
		  @get_emacs -= 1
		else
		  @life -= 1
		end
		@invincible_flag = 1
		end
	  when Lisp 
		@get_emacs = 0
	    @life -= 1
	  end
  end
end