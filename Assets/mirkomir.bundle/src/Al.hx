package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Al extends openfl.display.MovieClip {


	@:keep public var Shadow (default, null):openfl.display.MovieClip;
	@:keep public var AlWin (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1470);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Al") class Al extends openfl.display.MovieClip {


	@:keep public var Shadow (default, null):openfl.display.MovieClip;
	@:keep public var AlWin (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end