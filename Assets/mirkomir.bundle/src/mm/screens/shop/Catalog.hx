package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Catalog extends openfl.display.MovieClip {


	@:keep public var field (default, null):openfl.display.MovieClip;
	@:keep public var loader (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (114);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.Catalog") class Catalog extends openfl.display.MovieClip {


	@:keep public var field (default, null):openfl.display.MovieClip;
	@:keep public var loader (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end