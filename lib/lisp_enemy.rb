require_relative 'character'

class Lisp < Character
    def initialize(x, y)
        image = Image.load(image_path("lisp.png"))
        image.set_color_key([255, 255, 12])
        self.collision = ([0,16,14,31,31,0])
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
