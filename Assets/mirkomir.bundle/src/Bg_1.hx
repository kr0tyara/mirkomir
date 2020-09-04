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
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1413);

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