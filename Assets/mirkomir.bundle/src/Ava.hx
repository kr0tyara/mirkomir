package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Ava extends openfl.display.MovieClip {


	@:keep public var Shadow (default, null):openfl.display.MovieClip;
	@:keep public var character (default, null):Character_backside;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1273);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Ava") class Ava extends openfl.display.MovieClip {


	@:keep public var Shadow (default, null):openfl.display.MovieClip;
	@:keep public var character (default, null):Character_backside;
	

	public function new () {

		super ();

	}


}
#end