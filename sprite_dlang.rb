class Dlang < Sprite
    def initialize(x, y, image = nil)
        image = Image.load("images/dlang.png")
        image.set_color_key([0, 0, 0])
        super
        @dx = -10
        @dy = -25
    end

    def update
        self.x += @dx
        self.y += @dy
        @dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
        @dy = -@dy if self.y > (Window.height - self.image.height) || self.y < 0
    end
end
