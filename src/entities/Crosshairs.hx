package entities;

import com.haxepunk.graphics.Image;
import flash.ui.Mouse;
import com.haxepunk.Entity;

class Crosshairs extends Entity {

    private static var CenterCoords:Array<Int> = [54, 44];
    public function new() {
        super(0, 0);
        graphic = new Image("graphics/crosshairs.png");
        Mouse.hide();
    }

    public override function update() {
        super.update();
        x = scene.mouseX - CenterCoords[0];
        y = scene.mouseY - CenterCoords[1];
    }
}
