package scenes;

import entities.Crosshairs;
import entities.Crosshairs;
import entities.Hamster;
import entities.Hamster;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
class MeadowScene extends Scene {
    public function new() {
        super();
    }

    private static var HamsterCoords:Array<Array<Int>> =
    [[103, 84],
    [341, 57],
    [563, 84],
    [100, 255],
    [338, 255],
    [564, 251]];

    public override function begin() {
        var bg = new Image("graphics/meadow.png");
        //bg.set_scaledWidth(800);
        //bg.set_scaledHeight(600);
        addGraphic(bg);

        for (c in HamsterCoords) {
            add(new Hamster(c[0], c[1]));
        }

        add(new Crosshairs());
    }
}