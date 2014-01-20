import flash.display.StageAlign;
import flash.display.StageScaleMode;
import com.haxepunk.graphics.Image;
import scenes.WhackLevel;
import com.haxepunk.HXP;
import com.haxepunk.Engine;

class Main extends Engine {

    override public function init() {
#if debug
		HXP.console.enable();
#end

        Assets.load();

        //onResize(null);

        //HXP.stage.addEventListener(Event.RESIZE, onResize);

        HXP.stage.align = StageAlign.TOP_LEFT;
        HXP.stage.scaleMode = StageScaleMode.NO_SCALE;
        //#if mobile StageScaleMode.NO_SCALE #else StageScaleMode.SHOW_ALL #end;
/*
        #if mobile
        var ratio:Float = Capabilities.screenResolutionY / 600;
        HXP.screen.scale = ratio;

        // offsets the cursor HXP.screen.x = 200;
        // offsets the picture x = 200;
        // does nothing HXP.stage.x = 200;

        var x_offset:Int = Std.int((Capabilities.screenResolutionX - 1066 * ratio) / 2);
        this.x = HXP.screen.x = x_offset;
        #end
*/
        HXP.scene = new WhackLevel(Assets.meadow);
        //HXP.scene = new DebugScene();

    }

    public static function main() {

        new Main();
    }
}
