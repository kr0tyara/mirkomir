package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Bg_1 extends openfl.display.MovieClip {


	@:keep public var Bg (default, null):openfl.display.MovieClip;
	@:keep public var obj_7 (default, null):openfl.display.MovieClip;
	@:keep public var obj_5 (default, null):openfl.display.MovieClip;
	@:keep public var obj_2 (default, null):openfl.display.MovieClip;
	@:keep public var obj_6 (default, null):openfl.display.MovieClip;
	@:keep public var obj_3 (default, null):openfl.display.MovieClip;
	@:keep public var obj_1 (default, null):openfl.display.MovieClip;
	@:keep public var obj_4 (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1414);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Bg_1") class Bg_1 extends openfl.display.MovieClip {


	@:keep public var Bg (default, null):openfl.display.MovieClip;
	@:keep public var obj_7 (default, null):openfl.display.MovieClip;
	@:keep public var obj_5 (default, null):openfl.display.MovieClip;
	@:keep public var obj_2 (default, null):openfl.display.MovieClip;
	@:keep public var obj_6 (default, null):openfl.display.MovieClip;
	@:keep public var obj_3 (default, null):openfl.display.MovieClip;
	@:keep public var obj_1 (default, null):openfl.display.MovieClip;
	@:keep public var obj_4 (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end