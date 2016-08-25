class InfoWindow

  def initialize
    @font = Font.new(32)
	@ruby = Image.load("images/ruby.png")
	@vim = Image.load("images/vim.png")
	@emacs = Image.load("images/emacs.png")
	@ruby.set_color_key(C_WHITE)
	@vim.set_color_key(C_WHITE)
	@emacs.set_color_key(C_WHITE)
  end

  def draw
    player = Director.instance.player
	Window.draw(50, Window.height - 32, @ruby)
    Window.draw_font(100, Window.height - 32, " × #{player.get_ruby}", @font)
	Window.draw(200, Window.height - 32, @emacs)
    Window.draw_font(250, Window.height - 32, " × #{player.get_emacs}", @font)
	Window.draw(350, Window.height - 32, @vim) if player.get_vim == 1
  end
end
