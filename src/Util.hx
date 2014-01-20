class Util {

    public static function repeatString(x:String, n:Int):String {
        var s = "";
        for (i in 0...n) { s += x; }
        return s;
    }

    public static function shuffle<T>(a:Array<T>, ?n:Int):Array<T> {
        var r:Array<T> = [];
        if (n == null) n = a.length;
        for (i in 0...(n - 1)) {
            var ni = Std.random(a.length - i - 1) + i + 1;
            var tmp = a[ni];
            r[ni] = a[i];
            r[i] = a[ni];
        }
        return r;
    }


    public static function pickRandomElements<T>(a:Array<T>, n:Int):Array<T> {
        return shuffle(a, n).splice(0, n);
    }
}
