package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class BonusScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):mm.interfaces.Overlay;
	@:keep public var screen (default, null):Bonus;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1251);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("BonusScreen") class BonusScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):mm.interfaces.Overlay;
	@:keep public var screen (default, null):Bonus;
	

	public function new () {

		super ();

	}


}
#end