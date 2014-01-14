import flash.Lib;
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
        Lib.current.stage.align = StageAlign.TOP_LEFT;
        Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
        HXP.scene = new WhackLevel(new Image("graphics/meadow.png"));
    }
	
	public static function main() {
		new Main();
	}
}