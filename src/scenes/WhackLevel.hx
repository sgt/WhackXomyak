package scenes;

import entities.HamsterState;
import entities.HamsterState;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.Graphic;
import entities.Hamster;
import entities.Crosshairs;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
using Lambda;

class WhackLevel extends Scene {

    private inline static var scoreDigits = 6;

    private var elapsed:Float;
    private var killed:Int = 0;
    private var maxSimultaneousHamsters:Int = 2;

    private var bg:Graphic;
    private var score:Text;

    public function new(bg:Graphic) {
        this.bg = bg;
        super();
    }

    private static var HamsterCoords:Array<Array<Int>> =
    [[103, 84],
    [341, 57],
    [563, 84],
    [100, 255],
    [338, 255],
    [564, 251]];

    private static var nHamsters:Int = HamsterCoords.length;
    private static var hamsters:Array<Hamster> = new Array<Hamster>();

    private function createScore():Entity {
        score = new Text(Util.repeatString("0", scoreDigits), 0, 0);
        score.resizable = true;
        var overlay:Entity = new Entity(0, 20, score);
        //overlay.layer = 0;
        return overlay;
    }

    private function updateScore() {
        var scoreText = Std.string(killed * 10);
        score.text = Util.repeatString("0", scoreDigits - scoreText.length) + scoreText;
    }

    private function readyHamsters():Array<Hamster> {
        return hamsters.filter(function(h:Hamster) { return h.isReady(); });
    }

    private function activeHamsters():Array<Hamster> {
        return hamsters.filter(function(h:Hamster) { return h.state == HamsterState.OutThere; });
    }

    private function hamstersToShow():Array<Hamster> {
        var potentialHamsters = readyHamsters();
        var nHamstersOut = nHamsters - potentialHamsters.length;
        var diff = maxSimultaneousHamsters - nHamstersOut;
        var nHamstersToShow = diff <= 0 ? 0 : diff;
        return Util.pickRandomElements(potentialHamsters, nHamstersToShow);
    }

    public override function begin() {
        elapsed = 0;

        addGraphic(bg);

        for (i in 0...nHamsters) {
            var h = new Hamster(HamsterCoords[i][0], HamsterCoords[i][1]);
            hamsters.push(h);
            add(h);
        }

        add(new Crosshairs());

        add(createScore());
    }

    public override function update() {
        elapsed += HXP.elapsed;

        for (h in hamstersToShow()) {
            h.appear();
        }

        for (h in activeHamsters()) {
            if (h.isShot()) {
                h.dieViolentDeath();
                ++killed;
                updateScore();
            }

            if (h.elapsed >= Config.StayingOutBasePeriod) {
                h.disappear();
            }
        }

        super.update();
    }

}