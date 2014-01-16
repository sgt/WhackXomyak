package scenes;

import flash.system.Capabilities;
import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.Scene;

class DebugScene extends Scene {
    private var debugText:Text;

    private function createDebugText() {
        debugText = new Text("", 0, 0);
        debugText.resizable = true;
        var overlay:Entity = new Entity(0, 20, debugText);
        //overlay.layer = 0;
        return overlay;
    }

    private function updateDebugText() {
        debugText.text = "width = " + HXP.stage.width + "\n" +
        "stageWidth = " + HXP.stage.stageWidth + "\n" +
        "height = " + HXP.stage.height + "\n" +
        "stageHeight = " + HXP.stage.stageHeight + "\n" +
        "stage scaleX = " + HXP.stage.scaleX + "\n" +
        "stage scaleY = " + HXP.stage.scaleY + "\n" +
        "screen scaleX = " + HXP.screen.scaleX + "\n" +
        "screen scaleY = " + HXP.screen.scaleY + "\n" +
        "capabilities X = " + Capabilities.screenResolutionX + "\n" +
        "capabilities Y = " + Capabilities.screenResolutionY + "\n";

        // doesn't exist in android
        //"fullScreenWidth = " + HXP.stage.fullScreenWidth;
    }

    public override function new() {
        super();

        add(createDebugText());
        updateDebugText();

//        var ratio:Float = Capabilities.screenResolutionY / 600;
//        Log.trace("!!! -- ratio = " + ratio);
//        HXP.screen.scaleX = HXP.screen.scaleY = 1;
//        HXP.resize(HXP.stage.stageWidth, HXP.stage.stageHeight);
    }

    public override function update() {
        updateDebugText();
    }
}
