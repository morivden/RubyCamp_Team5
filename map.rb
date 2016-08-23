require 'dxruby'

Window.caption = "maptest"
Window.width = 800
Window.height = 600

# 背景の読み込み
bg_img = Image.load("images/maptest.png")
bg_d = Image.load("images/dlang.png")
bg_vim = Image.load("images/vim.png")

# メイン
Window.loop do
    # Escキーで終了
    break if Input.keyPush?(K_ESCAPE)

    # 背景を表示
    Window.draw(0, 0, bg_img)
    Window.draw(0, 0, bg_d)
    Window.draw(32, 0, bg_vim)
end
