require_relative 'character'

class Golang < Character
    DELTA = 2
    def initialize(x, y)
        image = Image.load(image_path("golang.png"))
        image.set_color_key(C_BLUE)
        self.collision = ([4,0,27,31])
        super(x, y, image)
    end

    def update
        dirs = calc_route( x, y )
        dirs.each do |dx, dy, distance|
            self.x += dx
            self.y += dy
            break unless Sprite.check(self, Director.instance.obstacles)
            self.x -= dx
            self.y -= dy
        end
    end

    def calc_route( tmp_x, tmp_y )
        player = Director.instance.player
        dirs = [0, DELTA, -DELTA].repeated_permutation(2).to_a
        dirs.unshift
        dirs = dirs.map do |dx, dy|
            ex = tmp_x + dx
            ey = tmp_y + dy
            distance = (( player.x - ex )**2) + (( player.y - ey )**2)
            [dx, dy, distance]
        end
        return dirs.sort_by { |e| e[2] }
    end
end
