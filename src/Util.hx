class Util {

    public static function repeatString(x:String, n:Int):String {
        var s = "";
        for (i in 0...n) { s += x; }
        return s;
    }

    public static function shuffle<T>(a:Array<T>):Array<T> {
        for (i in 0...a.length) {
            var ni = Std.random(a.length - i - 1) + i + 1;
            var tmp = a[ni];
            a[ni] = a[i];
            a[i] = tmp;
        }
        return a;
    }

    public static function pickRandomElements<T>(a:Array<T>, n:Int):Array<T> {
        if (n > 0) {
            return shuffle(a.copy()).splice(0, n);
        } else {
            return new Array<T>();
        }
    }
}