package entities;

import com.haxepunk.HXP;
import entities.HamsterState;
import com.haxepunk.Graphic;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;

class Hamster extends Entity {

    // hidden, out there or dying
    public var state(default, null):HamsterState;

    // time elapsed since last change of state.
    public var elapsed(default, null):Float;

    // time to wait till hide/appear
    private var ttw:Float;

    private var img:Image;

    public function new(x:Float, y:Float) {
        super(x, y);
        img = new Image("graphics/hamster_f1.png");
        setHitbox(img.width, img.height);
        set_type("hamster");
        state = HamsterState.Hidden;
        elapsed = 0;
    }

    public function appear() {
        set_graphic(img);
        elapsed = 0;
        state = HamsterState.OutThere;
    }

    public function disappear() {
        set_graphic(null);
        elapsed = 0;
        state = HamsterState.Hidden;
    }

    public function dieViolentDeath() {
        state = HamsterState.Dying;
        disappear();
    }

    public function isShot():Bool {
        return collidePoint(x, y, Input.mouseX, Input.mouseY) && Input.mouseDown;
    }

    public function isReady():Bool {
        return state == HamsterState.Hidden && elapsed >= Config.MinWaitBetweenAppearances;
    }

    override public function update():Void {
        elapsed += HXP.elapsed;
        super.update();
    }
}