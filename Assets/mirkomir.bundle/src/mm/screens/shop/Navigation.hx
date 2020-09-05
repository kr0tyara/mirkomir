package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Navigation extends openfl.display.MovieClip {


	@:keep public var btnStreetwear (default, null):openfl.display.SimpleButton;
	@:keep public var btnCatbox (default, null):openfl.display.SimpleButton;
	@:keep public var btnMurkea (default, null):openfl.display.SimpleButton;
	@:keep public var btnScatcher (default, null):openfl.display.SimpleButton;
	@:keep public var mcSelected (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (93);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.Navigation") class Navigation extends openfl.display.MovieClip {


	@:keep public var btnStreetwear (default, null):openfl.display.SimpleButton;
	@:keep public var btnCatbox (default, null):openfl.display.SimpleButton;
	@:keep public var btnMurkea (default, null):openfl.display.SimpleButton;
	@:keep public var btnScatcher (default, null):openfl.display.SimpleButton;
	@:keep public var mcSelected (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end