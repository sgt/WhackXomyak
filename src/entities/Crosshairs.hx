package entities;

import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import flash.ui.Mouse;
import com.haxepunk.Entity;

class Crosshairs extends Entity {

    private static var CenterCoords:Array<Int> = [48, 48];

    public function new() {
        super(0, 0);

        set_graphic(Assets.crosshairs);
        Mouse.hide();
        set_layer(0);
    }

    public override function update() {
        x = scene.mouseX - CenterCoords[0];
        y = scene.mouseY - CenterCoords[1];
        super.update();
    }
}
