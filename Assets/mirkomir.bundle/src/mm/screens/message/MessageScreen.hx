package mm.screens.message; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class MessageScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):openfl.display.MovieClip;
	@:keep public var screen (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (735);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.message.MessageScreen") class MessageScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):openfl.display.MovieClip;
	@:keep public var screen (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end