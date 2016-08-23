class Character
    # 初期化
    def initialize(x, y, image_file)
        @x, @y = x, y
        @image = Image.load(image_file)
        @image.set_color_key([0, 0, 0])
        @dx = 2
    end

    # 移動
    def move
        @x += @dx
        @dx = -@dx if @x > (Window.width - @image.width) || @x < 0
    end

    # 移動後の座標位置での描画
    def draw
        Window.draw(@x, @y, @image)
    end
end
