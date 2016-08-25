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
        Window.draw(30, Window.height - 32, @ruby)
        Window.draw_font(60, Window.height - 32, " × #{player.get_ruby}", @font)
        Window.draw(180, Window.height - 32, @emacs)
        Window.draw_font(220, Window.height - 32, " × #{player.get_emacs}", @font)
        Window.draw(320, Window.height - 32, @vim) if player.get_vim == 1
        Window.draw_font(370, Window.height - 32, "Rubyを10個集めてまつもとさんを救出しよう", @font)
    end
end
