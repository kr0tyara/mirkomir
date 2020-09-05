package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Bg_3 extends openfl.display.MovieClip {


	@:keep public var obj_11 (default, null):openfl.display.MovieClip;
	@:keep public var obj_6 (default, null):openfl.display.MovieClip;
	@:keep public var obj_7 (default, null):openfl.display.MovieClip;
	@:keep public var obj_5 (default, null):openfl.display.MovieClip;
	@:keep public var obj_4 (default, null):openfl.display.MovieClip;
	@:keep public var obj_12 (default, null):openfl.display.MovieClip;
	@:keep public var obj_10 (default, null):openfl.display.MovieClip;
	@:keep public var obj_2 (default, null):openfl.display.MovieClip;
	@:keep public var obj_3 (default, null):openfl.display.MovieClip;
	@:keep public var obj_13 (default, null):openfl.display.MovieClip;
	@:keep public var obj_1 (default, null):openfl.display.MovieClip;
	@:keep public var obj_9 (default, null):openfl.display.MovieClip;
	@:keep public var obj_8 (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1371);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Bg_3") class Bg_3 extends openfl.display.MovieClip {


	@:keep public var obj_11 (default, null):openfl.display.MovieClip;
	@:keep public var obj_6 (default, null):openfl.display.MovieClip;
	@:keep public var obj_7 (default, null):openfl.display.MovieClip;
	@:keep public var obj_5 (default, null):openfl.display.MovieClip;
	@:keep public var obj_4 (default, null):openfl.display.MovieClip;
	@:keep public var obj_12 (default, null):openfl.display.MovieClip;
	@:keep public var obj_10 (default, null):openfl.display.MovieClip;
	@:keep public var obj_2 (default, null):openfl.display.MovieClip;
	@:keep public var obj_3 (default, null):openfl.display.MovieClip;
	@:keep public var obj_13 (default, null):openfl.display.MovieClip;
	@:keep public var obj_1 (default, null):openfl.display.MovieClip;
	@:keep public var obj_9 (default, null):openfl.display.MovieClip;
	@:keep public var obj_8 (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end