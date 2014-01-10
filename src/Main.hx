import scenes.MeadowScene;
import com.haxepunk.HXP;
import com.haxepunk.Engine;
class Main extends Engine {
    override public function init() {
#if debug
		HXP.console.enable();
#end
        HXP.scene = new MeadowScene();
    }
}