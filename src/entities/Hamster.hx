package entities;

import entities.HamsterState;
import entities.HamsterState;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.masks.Imagemask;
import com.haxepunk.HXP;
import entities.HamsterState;
import com.haxepunk.Graphic;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;

class Hamster extends Entity {

// hidden, out there or dying
    public var state(default, null):HamsterState;

// time elapsed since last change of state.
    public var elapsed(default, null):Float;

// time to wait till hide/appear
    private var ttw:Float;

    private var sprite:Spritemap;

    public function new(x:Float, y:Float) {
        super(x, y);

        setupSprite();

        set_type("hamster");
        state = HamsterState.Hidden;
        elapsed = 0;
    }

    private function setupSprite():Void {
        sprite = Assets.createHamsterSprite();

        set_graphic(sprite);
        set_mask(new Imagemask(sprite));

        //setHitbox(sprite.width, sprite.height);
    }

    public function appear() {
        state = HamsterState.OutThere;
        sprite.play("appear");
        elapsed = 0;
    }

    public function disappear() {
        sprite.play("disappear");
    }

    public function dieViolentDeath() {
        state = HamsterState.Dying;
        sprite.play("die");
    }

    public function isShot():Bool {
        return state == HamsterState.OutThere && collidePoint(x, y, Input.mouseX, Input.mouseY) && Input.mousePressed;
    }

    public function isReadyToAppear():Bool {
        return state == HamsterState.Hidden && elapsed >= Config.MinWaitBetweenAppearances;
    }

    public function isCompletelyHidden():Bool {
        return sprite.complete && (sprite.currentAnim == "disappear" || sprite.currentAnim == "die");
    }

    public function isStandingHigh():Bool {
        return sprite.complete && sprite.currentAnim == "appear";
    }

    override public function update():Void {
        mask.update();

        if (isStandingHigh()) sprite.play("stand");
        else if ((state == HamsterState.Dying || state == HamsterState.OutThere) && isCompletelyHidden()) {
            state = HamsterState.Hidden;
            elapsed = 0;
        }
        else if (state == HamsterState.OutThere && elapsed >= Config.StayingOutBasePeriod) disappear();

        elapsed += HXP.elapsed;

        super.update();
    }
}
