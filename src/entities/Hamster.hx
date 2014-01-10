package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;

class Hamster extends Entity {
    public function new(x:Float, y:Float) {
        super(x, y);
        graphic = new Image("graphics/hamster_f1.png");
        setHitbox(137, 183);
        type = "hamster";
    }
}