require_relative 'character'

class Prison < Character
    def initialize(x, y)
        image = Image.load(image_path("rouya.png"))
        image.set_color_key(C_WHITE)
        super(x, y, image)
        @clear_flag = false
    end
    def hit(obj)
        player = Director.instance.player
        if obj.is_a?(Player) && player.get_ruby >= 10
            vanish
            @clear_flag = true
            Director.instance.ending_flag = true
        end
    end
end
