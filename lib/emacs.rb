require_relative 'character'

class Emacs < Character
    def initialize(x, y)
        @s2 = SoundEffect.new(1000,WAVE_TRI) do
            [140,80]
        end
        image = Image.load(image_path("emacs.png"))
        image.set_color_key(C_WHITE)
        super(x, y, image)
    end

    def hit(obj)
        if obj.is_a?(Player)
            vanish
            @s2.play
        elsif obj.is_a?(Dlang)
            vanish
        end
    end
end
