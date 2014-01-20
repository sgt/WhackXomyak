import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Image;

class Assets {

    private static inline var HAMSTER_W = 214;
    private static inline var HAMSTER_H = 219;

    public static var meadow(default, null):Image;
    public static var meadowCloudsAssetName(default, null):String = "graphics/meadow_clouds.png";
    public static var crosshairs(default, null):Image;

    public static function load() {
        meadow = new Image("graphics/meadow.png");
        crosshairs = new Image("graphics/crosshairs.png");
    }

    public static function createHamsterSprite():Spritemap {
        var sprite = new Spritemap("graphics/hamster_tilemap.png", HAMSTER_W, HAMSTER_H);

        sprite.add("appear", [0, 1, 2, 3, 4, 5], 10, false);
        sprite.add("stand", [5, 6, 5, 6, 7, 6, 5], 10, true);
        sprite.add("disappear", [4, 9, 8, 3, 0, 10, 11, 12, 17], 10, false);
        sprite.add("die", [13, 14, 15, 16, 17], 10, false);
        sprite.add("not_there", [17]);

        sprite.setAnimFrame("not_there", 0);

        return sprite;
    }

}
