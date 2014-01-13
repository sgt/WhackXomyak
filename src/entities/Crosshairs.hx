package entities;

import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import flash.ui.Mouse;
import com.haxepunk.Entity;

class Crosshairs extends Entity {

    private static var CenterCoords:Array<Int> = [54, 44];

    private var img:Graphic;

    public function new() {
        super(0, 0);
        img = new Image("graphics/crosshairs.png");
        set_graphic(img);
        Mouse.hide();
    }

    public override function update() {
        x = scene.mouseX - CenterCoords[0];
        y = scene.mouseY - CenterCoords[1];
        super.update();
    }
}
