class Director
    # 初期化
    def initialize
        # @dlang = Character.new(0, 300, "images/dlang.png")
        @dlang = Dlang.new(0, 300)
        @vim = Vim.new(0, 400)
        @bg_img = Image.load("images/maptest.png")
    end

    def play
        # 背景画像の描画
        Window.draw(0, 0, @bg_img)
        # Characterクラス内のmoveメソッドを呼び出し
        # @dlang.move
        # @vim.move
        # Characterクラス内のdrawメソッドを呼び出し
        # @dlang.draw
        # @vim.draw
        Sprite.update(@dlang)
        Sprite.update(@vim)

        Sprite.draw(@vim)
        Sprite.draw(@dlang)
        # Sprite.check(@vim, @dlang)
    end
end
