import flash.system.Capabilities;
import flash.system.Capabilities;
import haxe.Log;
import haxe.Log;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import com.haxepunk.graphics.Image;
import scenes.WhackLevel;
import com.haxepunk.HXP;
import com.haxepunk.Engine;

class Main extends Engine {

    override public function init() {
#if debug
		HXP.console.enable();
#end
        //onResize(null);

        //HXP.stage.addEventListener(Event.RESIZE, onResize);

        HXP.scene = new WhackLevel(new Image("graphics/meadow.png"));
        //HXP.scene = new DebugScene();

        HXP.stage.align = StageAlign.TOP_LEFT;
        HXP.stage.scaleMode = StageScaleMode.NO_SCALE;

        #if mobile
        var ratio:Float = Capabilities.screenResolutionY / 600;
        HXP.screen.scale = ratio;

        // offsets the cursor HXP.screen.x = 200;
        // offsets the picture x = 200;
        // does nothing HXP.stage.x = 200;

        var x_offset:Int = Std.int((Capabilities.screenResolutionX - 800 * ratio) / 2);
        this.x = HXP.screen.x = x_offset;
        #end

    }

    public static function main() {
        new Main();
    }

    public static function onResize(e:Event) {
        if (e == null) Log.trace("!!! manual call");
        Log.trace("!!! --- capabilities X = " + Capabilities.screenResolutionX);
        Log.trace("!!! --- capabilities Y = " + Capabilities.screenResolutionY);
        Log.trace("!!! --- stageHeight = " + HXP.stage.stageHeight);
        Log.trace("!!! --- height = " + HXP.stage.height);
        Log.trace("!!! --- stageWidth = " + HXP.stage.stageWidth);
        Log.trace("!!! --- width = " + HXP.stage.width);
        Log.trace("!!! --- scaleX = " + HXP.stage.scaleX);
        Log.trace("!!! --- scaleY = " + HXP.stage.scaleY);
    }

}
