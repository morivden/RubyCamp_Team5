class Director
    # 初期化
    def initialize
        @dlang = Character.new(0, 300, "images/dlang.png")
        @vim = Character.new(0, 400, "images/vim.png")
        @bg_img = Image.load("images/maptest.png")
    end

    def play
        # 背景画像の描画
        Window.draw(0, 0, @bg_img)
        # Characterクラス内のmoveメソッドを呼び出し
        @dlang.move
        @vim.move
        # Characterクラス内のdrawメソッドを呼び出し
        @dlang.draw
        @vim.draw
    end
end
